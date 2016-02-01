 //
//  VideoCollectionViewController.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/29/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersistenceController.h"

@interface VideoCollectionViewController : UICollectionViewController

@property (strong, nonatomic) PersistenceController *persistenceController;

@end
