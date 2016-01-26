//
//  PreviewView.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/26/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVCaptureSession;

@interface PreviewView : UIView
@property (nonatomic) AVCaptureSession *session;
@end
