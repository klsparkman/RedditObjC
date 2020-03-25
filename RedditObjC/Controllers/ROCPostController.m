//
//  ROCPostController.m
//  RedditObjC
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import "ROCPostController.h"
#import "ROCPost.h"

static NSString * const baseRedditURLString = @"https://www.reddit.com/r/funny.json";

@implementation ROCPostController

+(void)fetchPosts:(void(^)(NSArray<ROCPost *> * _Nonnull))completion
{
    NSURL *finalURL = [NSURL URLWithString:baseRedditURLString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error);
            completion(@[]);
            return;
        }
        if (!data)
        {
            NSLog(@"%@", error);
            completion(@[]);
            return;
        }
        
        NSDictionary *topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *secondLevelJSON = topLevelJSON[@"data"];
        NSArray<NSDictionary *> *thirdLevelJSON = secondLevelJSON[@"children"];
        //equivalent of [NSMutableArray alloc] init];
        NSMutableArray *arrayOfPosts = [NSMutableArray new];
        
        for (NSDictionary *currentDictionary in thirdLevelJSON)
        {
            NSDictionary *postDictionary = currentDictionary[@"data"];
            ROCPost *post = [[ROCPost alloc] initWithDictionary:postDictionary];
            [arrayOfPosts addObject:post];
        }
        completion(arrayOfPosts);
        
    }] resume];
}

+(void)fetchImageForPost:(ROCPost *)post completion:(void(^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:post.thumbnail];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        
    }] resume];
}
@end
