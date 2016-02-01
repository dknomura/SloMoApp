//
//  UINavigationController+TransparentNavigationController.m
//  SloMoCean
//
//  Created by Aditya Narayan on 1/29/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import "UINavigationController+TransparentNavigationController.h"

@implementation UINavigationController (TransparentNavigationController)
-(void) presentTransparentNavigationBar
{
//    [self.navigationBar setBackgroundImage:[[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault] forBarMetrics:UIBarMetricsDefault];
//    self.navigationBar.translucent = NO;
//    self.navigationBar.shadowImage = [[UINavigationBar appearance] shadowImage];

    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];

}

-(void) hideTransparentNavigationBar
{
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTranslucent:YES];
    self.navigationBar.shadowImage = [UIImage new];
//    self.view.backgroundColor = [UIColor clearColor];
//    self.navigationBar.backgroundColor = [UIColor clearColor];
}

@end
