//
//  ROCPost.m
//  RedditObjC
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import "ROCPost.h"

@implementation ROCPost

- (instancetype)initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail
{
    self = [super init];
    if (self)
    {
        _title = title;
        _thumbnail = thumbnail;
    }
    return self;
}

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
