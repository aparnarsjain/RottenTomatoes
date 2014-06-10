//
//  MovieCell.m
//  rottenTomatoes
//
//  Created by Aparna Jain on 6/4/14.
//  Copyright (c) 2014 FOX. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MovieCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public methods

- (void)setMovie:(Movie *)movie{
    _movie = movie;
    self.titleLabel.text = movie.title;
    self.synopsisLabel.text = movie.synopsis;
    
    [self.posterView setImageWithURL:[NSURL URLWithString:movie.thumbnailUrl]];
}
@end
