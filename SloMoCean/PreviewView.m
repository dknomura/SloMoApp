//
//  PreviewView.m
//  SloMoCean
//
//  Created by Aditya Narayan on 1/26/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//
@import AVFoundation;
#import "PreviewView.h"

@implementation PreviewView

+(Class) layerClass
{
    return  [AVCaptureVideoPreviewLayer class];
}

-(AVCaptureSession*) session
{
    AVCaptureVideoPreviewLayer *previewLayer = (AVCaptureVideoPreviewLayer *) self.layer;
    return previewLayer.session;
}

-(void) setSession:(AVCaptureSession *)session
{
    AVCaptureVideoPreviewLayer *previewLayer = (AVCaptureVideoPreviewLayer*)self.layer;
    previewLayer.session = session;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
