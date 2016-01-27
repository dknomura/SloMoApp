//
//  Video.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/27/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
-(UIImage*) convertImageData:(NSData*) imageData;

@end

NS_ASSUME_NONNULL_END

#import "Video+CoreDataProperties.h"
