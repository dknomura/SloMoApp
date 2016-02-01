//
//  VideoCollectionViewCell.h
//  SloMoCean
//
//  Created by Aditya Narayan on 1/29/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *videoThumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *videoInfo;
@property (weak, nonatomic) IBOutlet UILabel *videoTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end
