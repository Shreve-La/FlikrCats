//
//  PhotoCollectionViewController.m
//  Cats
//
//  Created by swcl on 2017-07-17.
//  Copyright © 2017 Shreve.ca. All rights reserved.
//

#import "PhotoCollectionViewController.h"
#import "Photo.h"
#import "CollectionViewCell.h"
#import "DetailViewCVC.h"

@interface PhotoCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, PhotoDelegate>

@property (strong, nonatomic) NSArray *photos;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end


@implementation PhotoCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark - NSURL Request for list of Cat Images
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=9cb38e23bf11507db90d9f3524cf3888&tags=cat"]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                             completionHandler:^(NSData* data, NSURLResponse*  response, NSError * error)
                              {
                                  NSLog(@"request finished");
                                  if (error != nil) {
                                      NSLog(@"Error making request: %@", error.localizedDescription);
                                      abort();
                                  }
//                                  NSLog(@"response data: %@", data);
                                  NSError *err = nil;
                                  NSArray *results = [NSJSONSerialization JSONObjectWithData:data
                                                                                     options:0
                                                                                       error:&err];
                                  if (err != nil) {
                                      NSLog(@"error parsing JSON data: %@", err.localizedDescription);
                                      abort();
                                  }
                                  
                                  NSMutableArray *tmpPhotos = [@[] mutableCopy];
                                  NSDictionary *photos  = [results valueForKeyPath:@"photos.photo"];
                                  for (NSDictionary* info in photos){
                                      Photo *photo = [[Photo alloc] initWithInfo:info];
                                      [tmpPhotos addObject:photo];
                                  }
                                  self.photos = [NSArray arrayWithArray:tmpPhotos];
                                  [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                                                        }];
                                  [self.collectionView reloadData];
                              }];
    [task resume];
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Photo *photo = self.photos[indexPath.row];
    
    cell.flickrTitle.text = photo.title;
    photo.delegate = self;

    
    if (!photo.image){
        [photo fetchImage];
    }
    
// add completion block
    
    cell.flickrPhoto.image = photo.image;

    return cell;

}

-(void)reloadData {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.collectionView reloadData];
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DestinationViewController"]){
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        Photo *photo = self.photos[indexPath.row];
        DetailViewCVC *dvc = segue.destinationViewController;
        dvc.photo = photo;
    }
}

#pragma mark <UICollectionViewDelegate>

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
