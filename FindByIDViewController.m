//
//  FindByIDViewController.m
//  CareFinder
//
//  Created by David Krawchuk on 3/8/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "FindByIDViewController.h"

#define EMPTY_TEXT @""

@interface FindByIDViewController ()

@end

@implementation FindByIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(recieveNotification:)
                                                 name:FETCH_BY_ID_NOTIFICATION_IDENTIFIER
                                               object:nil];
    
    // Make the controller the source and delegate for the tableview.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
}

#pragma mark -Search Bar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.activityIndicator startAnimating];
    [[self.clientServerCoordinator createHospitalClient] fetchHospitalWithUniqueID:[NSNumber numberWithInteger:[searchBar.text integerValue]] ForceDownload:YES];
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.text = EMPTY_TEXT;
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText{
    
}

@end
