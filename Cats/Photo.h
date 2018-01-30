//
//  Photo.h
//  Cats
//
//  Created by swcl on 2017-07-17.
//  Copyright © 2017 Shreve.ca. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@protocol PhotoDelegate <NSObject>

-(void)reloadData;

@end


@interface Photo : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL *photoUrl;
@property (strong, nonatomic) NSDictionary *info;
@property (weak, nonatomic) id<PhotoDelegate> delegate;


-(instancetype)initWithInfo:(NSDictionary*)info;

-(void)fetchImage;




@end
