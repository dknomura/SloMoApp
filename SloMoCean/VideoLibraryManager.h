//
//  VideoLibraryAccessObject.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/27/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Video.h"
#import "PersistenceController.h"


@interface VideoLibraryManager : NSObject
-(void) moveNewVideoAtURL:(NSURL*)outputFileURL;

@end
