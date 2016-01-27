//
//  VideoLibraryAccessObject.m
//  SloMoCean
//
//  Created by Aditya Narayan on 1/27/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import "VideoLibraryManager.h"

@interface VideoLibraryManager()
@property (strong, nonatomic) Video *video;

@end

@implementation VideoLibraryManager



#pragma mark - Camera to Video Directory Methods

-(void) moveNewVideoAtURL:(NSURL *)outputFileURL
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *videoDirectoryURL = [self dataPathForVideoDirectory];
    
    NSString *videoName = outputFileURL.lastPathComponent;
    NSURL *videoInDirectoryURL = [videoDirectoryURL URLByAppendingPathComponent:videoName isDirectory:NO];

    NSError *error;
    if (videoDirectoryURL) {
        [fileManager moveItemAtURL:outputFileURL toURL:videoInDirectoryURL error:&error];
        if (error) {
            NSLog(@"unable to move video to video directory, %@ \n %@", error.localizedDescription, error.userInfo);
        } else {
            [fileManager removeItemAtURL:outputFileURL error:&error];
            if (error) {
                NSLog(@"unable to remove temporary video file, %@, %@", error.localizedDescription, error.userInfo);
            }
        }
    }
}

-(void) setVideoCoreDataForVideoInVideoDirectory:(NSURL*)videoURL
{
    
}


-(NSURL*) dataPathForVideoDirectory
{
    NSError *error;
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, nil);
    NSString *documentsDirectory = [directoryPaths objectAtIndex:0];
    NSString *videoDirectory = [documentsDirectory stringByAppendingPathComponent:@"/VideoDirectory"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:videoDirectory]){
        [fileManager createDirectoryAtPath:videoDirectory withIntermediateDirectories:NO attributes:nil error:&error];
        if (error) {
            NSLog(@"Unable to create new video directory, %@", error.localizedDescription);
            abort();
        }
    }
    NSURL *videoDirectoryURL = [NSURL URLWithString:videoDirectory];

    return videoDirectoryURL;
}


@end
