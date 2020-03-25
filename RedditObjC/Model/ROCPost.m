//
//  ROCPost.m
//  RedditObjC
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import "ROCPost.h"

@implementation ROCPost
//Building the implementation of our initWithTitle
//func initWith(title: String, thumbnail: String) -> instancetype
- (instancetype)initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail
{
    //initializingour class
    //self = super.init
    self = [super init];
    //checking to make sure we have a model
    //if self != nil
    if (self)
    {
        //self.title = title
        _title = title;
        _thumbnail = thumbnail;
    }
    return self;
}
//creating our initializer
//init()
-(instancetype) init
{
    return [self initWithTitle:@"" thumbnail:@""];
}
@end

@implementation ROCPost (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[@"title"];
    NSString *thumbnail = dictionary[@"thumbnail"];
    
    return [self initWithTitle:title thumbnail:thumbnail];
}

@end
