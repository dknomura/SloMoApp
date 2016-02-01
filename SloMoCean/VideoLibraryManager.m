//
//  VideoLibraryAccessObject.m
//  SloMoCean
//
//  Created by Aditya Narayan on 1/27/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import "VideoLibraryManager.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import "Video.h"
#import "PersistenceController.h"


@interface VideoLibraryManager()
@property (strong, nonatomic) Video *video;

@end

@implementation VideoLibraryManager



#pragma mark - Camera to Video Directory Methods

-(void) moveNewVideoToVideoDirectory:(NSURL*)outputFileURL
{    
    NSString *videoDirectoryPath = [self pathForDocumentsDirectory];
    NSData *videoData = [NSData dataWithContentsOfURL:outputFileURL];

    
    NSString *videoName = outputFileURL.lastPathComponent;
    NSString *videoFilePath = [videoDirectoryPath stringByAppendingPathComponent:videoName];
    NSURL *videoFileURL = [NSURL fileURLWithPath:videoFilePath];
//    NSURL *videoURL = [NSURL fileURLWithPath: videoFilePath];
    
    NSError *error;
    [videoData writeToFile:videoFilePath options:NSDataWritingAtomic error:&error];
    
    if (error) {
        NSLog(@"Error writing video file, %@\n%@",error.localizedDescription, error.userInfo);
    }
    
//    if ([fileManager fileExistsAtPath:videoDirectoryPath]) {
//        if (![fileManager moveItemAtURL:outputFileURL toURL:videoFileURL error:&error]) {
//            if (error) {
//                NSLog(@"unable to copy video to video directory, %@ \n %@", error.localizedDescription, error.userInfo);
//            }
//        }
//    }
    [self updateCoreDataForNewVideo:videoFileURL];
}


-(void) updateCoreDataForNewVideo:(NSURL*)videoURL
{
    Video *newVideo = (Video*)[NSEntityDescription insertNewObjectForEntityForName:@"Video" inManagedObjectContext:self.persistenceController.managedObjectContext];
    
    newVideo.filePath = videoURL.path;

    AVAsset *videoAsset = [AVAsset assetWithURL:videoURL];
    
    NSUInteger totalSeconds = CMTimeGetSeconds(videoAsset.duration);
    NSUInteger hours = totalSeconds/3600;
    NSUInteger minutes = totalSeconds % 3600 / 60;
    NSUInteger seconds = totalSeconds % 3600 % 60 % 60;
    newVideo.length = [NSString stringWithFormat:@"%02lu:%02lu:%02lu",hours, minutes, seconds];
    
    AVAssetTrack *videoTrack = [[videoAsset tracksWithMediaType:AVMediaTypeVideo] lastObject];
    if (videoTrack) {
        newVideo.fps = [NSString stringWithFormat:@"%f", videoTrack.nominalFrameRate];
    }
    
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:videoAsset];
    imageGenerator.appliesPreferredTrackTransform = YES;
    NSError *error;
    if (imageGenerator) {
        CMTime time = CMTimeMake(0, 60);
        CGImageRef imageRef = [imageGenerator copyCGImageAtTime:time actualTime:nil error:&error];
        
        UIImage *image = [UIImage imageWithCGImage:imageRef];
        NSData *imageData = UIImageJPEGRepresentation(image, .35);
        newVideo.image = imageData;
    }
    
    [self.persistenceController save];
}


-(NSString*) pathForDocumentsDirectory
{
    NSError *error;
    NSString *directoryPath = (NSString*)[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].lastObject.path;
    NSString *videoDirectoryPath = [directoryPath stringByAppendingPathComponent:@"SloMoCean Videos"];
//    NSString *videoDirectoryPath = [directoryURL.path stringByAppendingPathComponent:@"SloMoCean Videos"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:videoDirectoryPath]) {
        if (![fileManager createDirectoryAtPath:videoDirectoryPath withIntermediateDirectories:NO attributes:nil error:&error]) {
            if (error) {
                NSLog(@"Error creating video directory, %@\n%@", error.localizedDescription, error.userInfo);
            }
        }

    }
//    NSURL *videoDirectoryURL = [NSURL URLWithString:videoDirectoryPath];
//    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, nil);
//    NSString *documentsDirectory = [directoryPaths objectAtIndex:0];

    return videoDirectoryPath;
}


#pragma mark - Managing Video Managed Objects
-(NSArray*) getVideoManagedObjects
{
    NSError *error = nil;
    NSFetchRequest *videoFetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Video"];
    NSSortDescriptor *sortVideoByName = [NSSortDescriptor sortDescriptorWithKey:@"filePath" ascending:YES];
    videoFetchRequest.sortDescriptors = @[sortVideoByName];
    NSArray *videoArray = [self.persistenceController.managedObjectContext executeFetchRequest:videoFetchRequest error:&error];
    
    return videoArray;
}

-(void) deleteVideo:(Video *)video
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    if ([fileManager removeItemAtPath:video.filePath error:&error]) {
        if (error) {
            NSLog(@"Error removing video: %@\n%@", error.localizedDescription, error.userInfo);
        }
    }
    [self.persistenceController.managedObjectContext deleteObject:video];
    [self.persistenceController save];
}

@end
