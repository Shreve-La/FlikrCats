//
//  FlickrAPI.h
//  Cats
//
//  Created by swcl on 2017-07-17.
//  Copyright © 2017 Shreve.ca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface FlickrAPI : NSObject

+ (void)searchFor:(NSString*)query complete:(void(^)(NSArray* searchResults))complete;

+ (void)loadImage:(Photo*)photo complete:(void (^)(UIImage* image))complete;

@end
