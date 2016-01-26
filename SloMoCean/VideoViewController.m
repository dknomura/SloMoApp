//
//  VideoViewController.m
//  SloMoCean
//
//  Created by Aditya Narayan on 1/26/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//
@import AVFoundation;
@import Photos;

#import "VideoViewController.h"
#import "PreviewView.h"

static void * sessionRunningContext = &sessionRunningContext;

typedef NS_ENUM(NSInteger, AVCamSetupResult){
    AVCamSetupResultSuccess,
    AVCamSetupResultCameraNotAuthorized,
    AVCamSetupResultSessionConfigurationFailed
};

@interface VideoViewController () <AVCaptureFileOutputRecordingDelegate>

//Storyboard properties
@property (weak, nonatomic) IBOutlet UIButton *resumeRecording;
@property (weak, nonatomic) IBOutlet UISegmentedControl *fpsSegControl;
@property (weak, nonatomic) IBOutlet UILabel *cameraUnavailableLabel;
@property (weak, nonatomic) IBOutlet UIButton *libraryButton;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;

//Session Management properties
@property (nonatomic) dispatch_queue_t sessionQueue;
@property (nonatomic) AVCaptureSession *session;
@property (nonatomic) AVCaptureDeviceInput *videoDeviceInput;
@property (nonatomic) AVCaptureMovieFileOutput *movieFileOutput;

//Utilities
@property (nonatomic) AVCamSetupResult setupResult;
@property (nonatomic, getter=isSessionRunning) BOOL sessionRunning;
@property (nonatomic) UIBackgroundTaskIdentifier *backgroundRecordingID;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
