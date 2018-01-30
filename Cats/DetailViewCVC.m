//
//  DetailViewCVC.m
//  Cats
//
//  Created by swcl on 2017-07-17.
//  Copyright © 2017 Shreve.ca. All rights reserved.
//

#import "DetailViewCVC.h"

@interface DetailViewCVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@property (weak, nonatomic) IBOutlet UILabel *detailTitle;



@end



@implementation DetailViewCVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.imageView.image = self.photo.image;
    self.detailTitle.text = self.photo.title;

}




@end
