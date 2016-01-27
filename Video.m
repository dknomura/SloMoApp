//
//  Video.m
//  SloMoCean
//
//  Created by Aditya Narayan on 1/27/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import "Video.h"

@implementation Video

-(UIImage*) convertImageData:(NSData *)imageData
{
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}
// Insert code here to add functionality to your managed object subclass

@end
