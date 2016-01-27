//
//  PersistenceController.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/27/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void (^InitCallbackBlock)(void);

@interface PersistenceController : NSObject
@property (strong, readonly) NSManagedObjectContext *managedObjectContext;
-(id)initWithCallback:(InitCallbackBlock)callback;
-(void) save;



@end
