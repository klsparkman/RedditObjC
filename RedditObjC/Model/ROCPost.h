//
//  ROCPost.h
//  RedditObjC
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ROCPost : NSObject

@property (nonatomic, copy) NSString *title;
//Nullable means that the thumbnail is optional
@property (nonatomic, copy, nullable) NSString *thumbnail;

-(instancetype) initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail;

@end

@interface ROCPost (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary *)dictionary;
 
@end

NS_ASSUME_NONNULL_END
