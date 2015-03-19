//
//  FindHosptialsByCityStateViewController.m
//  CareFinder
//
//  Created by David Krawchuk on 3/9/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "FindHosptialsByCityStateViewController.h"

#define EMPTY_TEXT @""

@interface FindHosptialsByCityStateViewController ()

@end

@implementation FindHosptialsByCityStateViewController

- (void)setup{
    // Register for the notification.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(recieveNotification:)
                                                 name:FETCH_BY_CITY_STATE_NOTIFICATION_IDENTIFIER
                                               object:nil];
    
    // Make the controller the source and delegate for the tableview and search bar.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.citySearchBar.delegate = self;
    self.stateSearchBar.delegate = self;
}

#pragma mark -Search Bar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if (self.activeSearchBar == self.stateSearchBar) {
        [self.activityIndicator startAnimating];
        
        // Create client and fetch results.
        [[self.clientServerCoordinator createHospitalClient] fetchHospitalsWithCity:self.citySearchBar.text
                                                                          WithState:self.stateSearchBar.text
                                                                      ForceDownload:YES];
        
        self.citySearchBar.text = EMPTY_TEXT;
        self.stateSearchBar.text = EMPTY_TEXT;
        [searchBar resignFirstResponder];
    }
    else
    {
        self.activeSearchBar = self.stateSearchBar;
        [self.activeSearchBar becomeFirstResponder];
    }

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    self.citySearchBar.text = EMPTY_TEXT;
    self.stateSearchBar.text = EMPTY_TEXT;
    
    self.activeSearchBar = self.citySearchBar;
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    self.activeSearchBar = searchBar;
}

@end
