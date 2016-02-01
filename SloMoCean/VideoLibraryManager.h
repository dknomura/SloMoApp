//
//  VideoLibraryAccessObject.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/27/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Video.h"
#import "PersistenceController.h"
#import "VideoInfo.h"


@interface VideoLibraryManager : NSObject
@property (strong, nonatomic) PersistenceController *persistenceController;
-(void) moveNewVideoToVideoDirectory:(NSURL*)outputFileURL;
-(NSArray*) getVideoManagedObjects;
-(NSMutableArray*) getVideoObjects;
//-(void) deleteVideo:(Video*) video;
-(void) deleteVideo:(VideoInfo *)video;


@end
