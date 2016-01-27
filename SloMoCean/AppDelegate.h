//
//  AppDelegate.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/13/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersistenceController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, readonly) PersistenceController *persistenceController;


@end

