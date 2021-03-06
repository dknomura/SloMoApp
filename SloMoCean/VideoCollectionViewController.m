//
//  VideoCollectionViewController.m
//  SloMoCean
//
//  Created by Aditya Narayan on 1/29/16.
//  Copyright © 2016 Daniel Nomura. All rights reserved.
//

#import "VideoCollectionViewController.h"
#import "VideoLibraryManager.h"
#import "VideoCollectionViewCell.h"
#import "UINavigationController+TransparentNavigationController.h"
#import "VideoPlayerViewController.h"
#import "VideoInfo.h"

@interface VideoCollectionViewController ()
@property (strong, nonatomic) NSMutableArray *videoList;
@property (strong, nonatomic) NSArray *videoFPSTypes;
@property (strong, nonatomic) VideoCollectionViewCell *videoCollectionViewCell;
//@property (strong, nonatomic) Video *currentVideo;
@end

@implementation VideoCollectionViewController

static NSString * const reuseIdentifier = @"VideoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadVideoLists];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController presentTransparentNavigationBar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) loadVideoLists
{
    VideoLibraryManager *videoLibraryManager = [[VideoLibraryManager alloc]init];
//    videoLibraryManager.persistenceController = self.persistenceController;
//    self.videoList = [NSMutableArray arrayWithArray:[videoLibraryManager getVideoManagedObjects]];
    self.videoList = [videoLibraryManager getVideoObjects];
    self.videoFPSTypes = [videoLibraryManager getFPSSetFromVideoList:self.videoList];
    //To add sections implement add fps to NSMutableSet below and get set.count
//    for (Video *video in self.videoList){
//        [self.videoFPSTypes addObject:video.fps];
//    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.videoFPSTypes.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray *arrayOfVideosInSection = [NSMutableArray new];
    for (VideoInfo *video in self.videoList){
        if (video.fps == [self.videoFPSTypes[section] integerValue]) {
            [arrayOfVideosInSection addObject:[NSObject new]];
        }
    }
    return arrayOfVideosInSection.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    VideoInfo *currentVideo = [self.videoList objectAtIndex:indexPath.row];
    
    cell.videoThumbnailImageView.image = currentVideo.thumbnailImage;
    
    NSString *videoName = currentVideo.name;
    cell.videoInfo.text = videoName;
    
    cell.videoTimeLabel.text = currentVideo.duration;
    // Configure the cell
    
    if (self.editing) {
        cell.deleteButton.hidden = NO;
    } else{
        cell.deleteButton.hidden = YES;
    }

    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.editing) {
        [self removeCellAtIndexPath:indexPath];
    } else {
        VideoInfo *currentVideo = [self.videoList objectAtIndex:indexPath.row];
        
        VideoPlayerViewController *videoPlayerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoPlayer"];
        
//        VideoPlayerViewController *videoPlayerViewController = [[VideoPlayerViewController alloc] init];
        
        videoPlayerViewController.currentVideo = currentVideo;
        videoPlayerViewController.videoList = self.videoList;
        //    [self showViewController:videoPlayerViewController sender:nil];
        
        [self.navigationController pushViewController:videoPlayerViewController animated:YES];

    }
}


-(void) removeCellAtIndexPath:(NSIndexPath*) indexPath
{
    [self.collectionView performBatchUpdates:^{
        VideoLibraryManager *videoLibraryManager = [[VideoLibraryManager alloc] init];
//        videoLibraryManager.persistenceController = self.persistenceController;
        VideoInfo *currentVideo = self.videoList[indexPath.row];
        [videoLibraryManager deleteVideo:currentVideo];
        [self.videoList removeObject:currentVideo];
        [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:nil];
}


-(void) setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    [self.collectionView reloadData];
}

//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"PushVideoPlayer"]) {
//        VideoPlayerViewController *videoPlayerController = [segue destinationViewController];
//        videoPlayerController.currentVideo = self.currentVideo;
//    }
//}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
