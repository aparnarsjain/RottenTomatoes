//
//  abridgedCast.h
//  rottenTomatoes
//
//  Created by Aparna Jain on 6/5/14.
//  Copyright (c) 2014 FOX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CastMember : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *characters;

- (id)initWithDictionary: (NSDictionary *)dictionary;
+ (NSArray *)castMembersWithArray: (NSArray *)array;

@end
