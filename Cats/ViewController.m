////
////  ViewController.m
////  Cats
////
////  Created by swcl on 2017-07-17.
////  Copyright © 2017 Shreve.ca. All rights reserved.
////
//
//#import "ViewController.h"
//#import "Photo.h"
//#import "DetailViewCVC.h"
//
//@interface ViewController () <UICollectionViewDataSource>
//
//@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
//
//@property (strong, nonatomic) NSArray *photos;
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.collectionView.dataSource = self;
//    
//    
//#pragma mark - NSURL Request for list of Cat Images
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=9cb38e23bf11507db90d9f3524cf3888&tags=cat"]];
//    
//    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
//                                                             completionHandler:^(NSData* data, NSURLResponse*  response, NSError * error) {
//                                                                 NSLog(@"request finished");
//                                                                 if (error != nil) {
//                                                                     NSLog(@"Error making request: %@", error.localizedDescription);
//                                                                     abort();
//                                                                 }
//                                                                 NSLog(@"response data: %@", data);
//
//                                                                 NSError *err = nil;
//
//    NSArray *results = [NSJSONSerialization JSONObjectWithData:data
//                                                    options:0
//                                                    error:&err];
//                                                                 if (err != nil) {
//                                                                     NSLog(@"error parsing JSON data: %@", err.localizedDescription);
//                                                                     abort();
//                                                                 }
//                                                                 
//
//NSMutableArray *tmpPhotos = [@[] mutableCopy];
//for (NSDictionary *info in results) {
//Photo *photo = [[Photo alloc] initWithInfo:info];
//[tmpPhotos addObject:photo];
//}
//self.photos = [NSArray arrayWithArray:tmpPhotos];
//                                                               
//[[NSOperationQueue mainQueue] addOperationWithBlock:^{
//[self.collectionView reloadData];
//}];
//                                                                 
//}];
//    [task resume];
//}
//
//#pragma mark <UICollectionViewDataSource>
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}
//
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.photos.count;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    DetailViewCVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
//                            forIndexPath:indexPath];
//    
//    Photo *photo = self.photos[indexPath.row];
//    
//    cell.photo.image = photo.image;
//    cell.title.text = @"title";
//    
//    
//    return cell;
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if([segue.identifier isEqualToString:@"DetailViewController"]){
//        //getdata
//        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
//        Photo *photo = self.photos[indexPath.row];
//        //reference to destination
//        DetailViewCVC *dvc = segue.destinationViewController;
//        dvc.photo = photo;
//    }
//}
//
//
//@end
