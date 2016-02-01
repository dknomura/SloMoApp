//
//  Video+CoreDataProperties.h
//  SloMoCean
//
//  Created by Aditya Narayan on 2/1/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Video.h"

NS_ASSUME_NONNULL_BEGIN

@interface Video (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *filePath;
@property (nullable, nonatomic, retain) NSString *fps;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSString *length;
@property (nullable, nonatomic, retain) NSNumber *attribute;

@end

NS_ASSUME_NONNULL_END
