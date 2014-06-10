//
//  MoviesViewController.m
//  rottenTomatoes
//
//  Created by Aparna Jain on 6/4/14.
//  Copyright (c) 2014 FOX. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "CastMember.h"
#import "Movie.h"
#import "MovieDetailsViewController.h"
#import "AFNetworkReachabilityManager.h"
#import "MBProgressHUD.h"


@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (nonatomic, strong) NSArray *movies;
@property (weak, nonatomic) IBOutlet UIView *networkError;
@end

@implementation MoviesViewController

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
    
    [self pullToRefreshSetUp];
    [self progressIndicatorDisplay];
    self.navigationItem.title = @"Movies";
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 130;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];

}
- (void)pullToRefreshSetUp {
    //alloc a table view controller and then point it to this view controller's tableview
    UITableViewController *tvc = [[UITableViewController alloc] init];
    tvc.tableView = self.tableView;
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.tintColor = [UIColor grayColor];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refresh addTarget:self action:@selector(loadData:) forControlEvents:UIControlEventValueChanged];
    tvc.refreshControl = refresh;
}

- (void) progressIndicatorDisplay {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [self loadData: nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });

}
- (void) loadData: (id)sender {
    NSString *url  = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=ahr6a67dtjm65hxf3qzn5723";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(connectionError) {
         UIView *errorView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 320, 35)];
            UILabel *errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 5, 200, 20)];
            errorLabel.text = @"Network Error";
            errorLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
            errorView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
            [errorView addSubview:errorLabel];
            self.tableView.tableHeaderView = errorView;
        }else {
            self.tableView.tableHeaderView = nil;
        }
        if(data){
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            //massage the data from the network into our model
            self.movies = [Movie moviesWithArray:object[@"movies"]];
            [self.tableView reloadData];
        }
        [(UIRefreshControl *)sender endRefreshing];

    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    movieCell.movie = self.movies[indexPath.row];
    return movieCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieDetailsViewController *vc = [[MovieDetailsViewController alloc] init];
    vc.movie = self.movies[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
