//
//  VideoInfo.h
//  SloMoCean
//
//  Created by Aditya Narayan on 2/1/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VideoInfo : NSObject
@property (strong, nonatomic) NSString *filePath;
@property (strong, nonatomic) NSString *fps;
@property (strong, nonatomic) NSString *name;
//@property (strong, nonatomic) NSData *imageData;
@property (strong, nonatomic) UIImage *thumbnailImage;
@property (strong, nonatomic) NSString *duration;
@end
