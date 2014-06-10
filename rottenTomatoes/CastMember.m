//
//  abridgedCast.m
//  rottenTomatoes
//
//  Created by Aparna Jain on 6/5/14.
//  Copyright (c) 2014 FOX. All rights reserved.
//

#import "CastMember.h"

@implementation CastMember

- (id)initWithDictionary: (NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.characters = dictionary[@"characters"];
    }
    return self;
 
}

+ (NSArray *)castMembersWithArray: (NSArray *)array {
    NSMutableArray *castMembers = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in array) {
        CastMember *member = [[CastMember alloc] initWithDictionary:dictionary];
        [castMembers addObject:member];
    }
    return castMembers;
}
@end
