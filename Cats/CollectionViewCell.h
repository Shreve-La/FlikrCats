//
//  CollectionViewCell.h
//  Cats
//
//  Created by swcl on 2017-07-17.
//  Copyright © 2017 Shreve.ca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *flickrPhoto;
@property (weak, nonatomic) IBOutlet UILabel *flickrTitle;

@end
