//
//  FlickrAPI.m
//  Cats
//
//  Created by swcl on 2017-07-17.
//  Copyright © 2017 Shreve.ca. All rights reserved.
//

#import "FlickrAPI.h"
#import "API_Keys.h"
#import "Photo.h"

@implementation FlickrAPI

+ (void)searchFor:(NSString *)query complete:(void(^)(NSArray* searchResults))complete
{
    NSURL *queryURL = [NSURL URLWithString:
                       [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=%@&tags=%@",
                        FKey,
                        query]];
    NSURLSessionTask *task = [[NSURLSession sharedSession]
                              dataTaskWithURL:queryURL
                              completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                  // this won't get executed until *after* this function returns!
                                  if (error) { abort(); }
                                  
                                  NSError *err = nil;
                                  NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
                                  if (err != nil) { abort(); }
                                  // do something with results to get an array of photos
                                  NSLog(@"results");
                                  NSMutableArray *photosFound = [@[] mutableCopy];
                                  for (NSDictionary *info in results[@"photos"][@"photo"]) {
                                      [photosFound addObject:[[Photo alloc] initWithInfo:info]];
                                  }
                                  complete(photosFound);
                              }];
    [task resume];
    // return @[];
}

+ (void)loadImage:(Photo *)photo complete:(void (^)(UIImage *))complete
{
    NSURLSessionTask *task = [[NSURLSession sharedSession]
                              dataTaskWithURL:photo.photoUrl
                              completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                  if (error) { abort(); }
                                  
                                  UIImage *loadedImage = [UIImage imageWithData:data];
                                  complete(loadedImage);
                              }];
    [task resume];
}

@end


