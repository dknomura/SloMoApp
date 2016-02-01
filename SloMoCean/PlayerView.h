//
//  PlayerView.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/30/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerView : UIView
@property AVPlayer *player;
@property (readonly) AVPlayerLayer *playerLayer;
@end
