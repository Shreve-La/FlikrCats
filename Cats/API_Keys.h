//
//  API_Keys.h
//  Cats
//
//  Created by swcl on 2017-07-17.
//  Copyright © 2017 Shreve.ca. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface API_Keys : NSObject

@property (nonatomic, readonly) NSString *FKey;
@property (nonatomic, readonly) NSString *FSecret;

@end

@implementation API_Keys

NSString *FKey = @"9cb38e23bf11507db90d9f3524cf3888";
NSString *FSecret = @"e734e07b5d34c81f";

@end
