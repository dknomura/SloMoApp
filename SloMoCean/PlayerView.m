//
//  PlayerView.m
//  SloMoCean
//
//  Created by Aditya Narayan on 1/30/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import "PlayerView.h"


@implementation PlayerView
-(AVPlayer*) player
{
    return self.playerLayer.player;
}

-(void) setPlayer:(AVPlayer *)player
{
    self.playerLayer.player = player;
}

+(Class) layerClass
{
    return [AVPlayerLayer class];
}

-(AVPlayerLayer*) playerLayer
{
    return (AVPlayerLayer*) self.layer;
}

@end
