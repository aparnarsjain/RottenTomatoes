//
//  MovieDetailsViewController.m
//  rottenTomatoes
//
//  Created by Aparna Jain on 6/5/14.
//  Copyright (c) 2014 FOX. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *movieBigPoster;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@property (weak, nonatomic) IBOutlet UIView *synopsisView;
@property (weak, nonatomic) IBOutlet UIScrollView *synopsisScrollView;

@end

@implementation MovieDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.movieBigPoster setImageWithURL:[NSURL URLWithString:self.movie.posterUrl]];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Movies" style: UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    self.navigationItem.title = self.movie.title;
    
    self.movieNameLabel.text = _movie.title;
    
    self.synopsisView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    self.synopsisLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [self.synopsisLabel setNumberOfLines:0];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];

    self.synopsisLabel.text = self.movie.synopsis;
    [self.synopsisLabel sizeToFit];
    
    // recompute the size of the background view now that we know the height of the synopsis label
    CGRect newBackgroundViewFrame = self.synopsisView.frame;

    newBackgroundViewFrame.size.height = self.synopsisLabel.frame.origin.y + self.synopsisLabel.frame.size.height;
    self.synopsisView.frame = newBackgroundViewFrame;
    
    //the scrollview contentSize should be set to a larger height so that it starts scrolling
    [self.synopsisScrollView setContentSize:CGSizeMake(self.synopsisScrollView.frame.size.width, self.synopsisView.frame.origin.y + self.synopsisView.frame.size.height)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
