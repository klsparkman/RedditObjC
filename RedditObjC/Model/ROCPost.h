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
//Declaring a property of type string called title
//ex)let title: string
@property (nonatomic, copy) NSString *title;
//Nullable means that the thumbnail is optional
//Declaring a property of type string called thumbnail
//var thumbnail: string
@property (nonatomic, copy, nullable) NSString *thumbnail;
//Creating a method signature called initWithTitle that takes in a title and a thumbnail
//gunc initWith(title: String, thumbnail: String) -> instancetype
-(instancetype) initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail;

@end
//Creating an extension of ROCPost
//extension ROCPost: JSONConvertable
@interface ROCPost (JSONConvertable)
//Declaring a method signature called initWithDictionary that takes in an NSDictionary and returns an instancetype
//func initWith(dictionary: Dictionary) -> instancetype
-(instancetype) initWithDictionary:(NSDictionary *)dictionary;
 
@end

NS_ASSUME_NONNULL_END
