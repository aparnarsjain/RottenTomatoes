//
//  Movie.m
//  rottenTomatoes
//
//  Created by Aparna Jain on 6/5/14.
//  Copyright (c) 2014 FOX. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithDictionary: (NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];
        self.synopsis = dictionary[@"synopsis"];
        self.thumbnailUrl = dictionary[@"posters"][@"thumbnail"];
        self.posterUrl = dictionary[@"posters"][@"original"];
    }
    return self;
    
}

+ (NSArray *)moviesWithArray: (NSArray *)array {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in array) {
        Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    return movies;
}

@end
