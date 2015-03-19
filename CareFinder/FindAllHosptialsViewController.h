//
//  FindAllHosptialsViewController.h
//  CareFinder
//
//  Created by David Krawchuk on 2/28/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ClientServerCordinator.h"
#import "URLConstants.h"

@interface FindAllHosptialsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (nonatomic, weak) ClientServerCordinator *clientServerCoordinator;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) UISearchBar *activeSearchBar;

- (void)setup;
- (void)cleanup;
-(void)recieveNotification:(NSNotification *)notification;
- (void)populateTableWithFetchedResults:(NSArray *)fetchedResults;
@end
