//
//  VideoPlayerViewController.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/30/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "VideoInfo.h"

@interface VideoPlayerViewController : UIViewController
@property (readonly) AVPlayer *player;
//@property AVURLAsset *asset;
@property AVURLAsset *asset;
@property CMTime currentTime;
@property (readonly) CMTime duration;
@property float rate;
@property (strong, nonatomic) VideoInfo *currentVideo;
@property (strong, nonatomic) NSMutableArray *videoList;
//@property (strong, nonatomic) NSArray *videoList;

@end
