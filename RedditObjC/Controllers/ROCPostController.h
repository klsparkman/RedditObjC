//
//  ROCPostController.h
//  RedditObjC
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ROCPost;

@interface ROCPostController : NSObject

+(void)fetchPosts:(void(^)(NSArray<ROCPost *> *))completion;
+(void)fetchImageForPost:(ROCPost *)post completion:(void(^)(UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
