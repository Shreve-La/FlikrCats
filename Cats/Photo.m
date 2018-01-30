
//
//  Photo.m
//  Cats
//
//  Created by swcl on 2017-07-17.
//  Copyright © 2017 Shreve.ca. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithInfo:(NSDictionary*)info{
    self = [super init];
    if (self){
    _title = info[@"title"];
    _photoUrl = [self buildUrl:info];
        _info = [[NSDictionary alloc] initWithDictionary: info];
        
    }
    return self;
}


-(NSURL*)buildUrl:(NSDictionary*)info{
    NSString *farmID = info[@"farm"];
    NSString *serverID = [info valueForKey:@"server"];
    NSString *photoID = [info valueForKey:@"id"];
    NSString *secret = info[@"secret"];
    NSString *url = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", farmID, serverID, photoID, secret];
  //  NSLog(@"%@", url);
    self.photoUrl = [NSURL URLWithString:url];
    return self.photoUrl;
}

-(void)fetchImage{
    NSURLRequest *request = [NSURLRequest requestWithURL:self.photoUrl];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                             completionHandler:^(NSData* data, NSURLResponse*  response, NSError * error)
                              {
                                NSLog(@"request for photo.image finished");
                                  if (error != nil) {
                                      NSLog(@"Error making request: %@", error.localizedDescription);
                                      abort();
                                  }
                                  
                                NSLog(@"response data: %@", data);
                                UIImage *downloadedImage = [UIImage imageWithData:data];
                                self.image = downloadedImage;
                                [self.delegate reloadData];
                                  
                            }
                              ];
    [task resume];

}




@end
