//
//  Movie.h
//  rottenTomatoes
//
//  Created by Aparna Jain on 6/5/14.
//  Copyright (c) 2014 FOX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *thumbnailUrl;
@property (nonatomic, strong) NSString *posterUrl;

- (id)initWithDictionary: (NSDictionary *)dictionary;
+ (NSArray *)moviesWithArray: (NSArray *)array;
@end
