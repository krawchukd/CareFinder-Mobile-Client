//
//  FindAllHosptialsViewController.m
//  CareFinder
//
//  Created by David Krawchuk on 2/28/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "FindAllHosptialsViewController.h"
#import "HospitalName_ParserDelegate.h"
#import "Provider_ID_ParserDelegate.h"
#import "HospitalItemDetailsViewController.h"

#define EMPTY_STRING @""

@interface FindAllHosptialsViewController ()
@property (strong, atomic) NSMutableArray *displayArray;
@property (strong, atomic) NSArray *fetchedResultsArray;
@end

@implementation FindAllHosptialsViewController

#pragma mark -Setter/Getter
- (ClientServerCordinator *)clientServerCoordinator{
    if (!_clientServerCoordinator) {
        _clientServerCoordinator = ((AppDelegate *)[UIApplication sharedApplication].delegate).clientServerCordinator;
    }
    return _clientServerCoordinator;
}

#pragma mark -Controller Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    [self setup];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    [self cleanup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(recieveNotification:)
                                                 name:FETCH_ALL_NOTIFICATION_IDENTIFIER
                                               object:nil];
    
    // Make the controller the source and delegate for the tableview.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)cleanup{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.displayArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Hospital_Item_Row" forIndexPath:indexPath];
    
    NSDictionary *itemDictionary = self.displayArray[indexPath.row];
    
    cell.textLabel.text = [itemDictionary objectForKey:[HospitalName_ParserDelegate description]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Provider ID: %@", [itemDictionary objectForKey:[Provider_ID_ParserDelegate description]]];
    
    return cell;
}

#pragma mark -Notification Callback
-(void)recieveNotification:(NSNotification *)notification{
    // Retrieve client.
    id client = [notification.userInfo objectForKey:@"client"];
    // Retrieve coordinator.
    id coordinator = [notification.userInfo objectForKey:@"coordinator"];
    
    // Populate displayArray.
    [self populateTableWithFetchedResults:[coordinator arrayOfItems]];
    
    // Remove client from client/server coordinator.
    [self.clientServerCoordinator.dictionaryOfActiveClients removeObjectForKey:[NSString stringWithFormat:@"%lu", (unsigned long)[client hash]]];
    
}

#pragma mark -Array Populate
- (void)populateTableWithFetchedResults:(NSArray *)fetchedResults{
   
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       // Sort Array.
       self.fetchedResultsArray = [fetchedResults sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
           NSDictionary *dictionary1 = obj1;
           NSDictionary *dictionary2 = obj2;
           
           NSString *hosptial1 = [dictionary1 objectForKey:[HospitalName_ParserDelegate description]];
           NSString *hosptial2 = [dictionary2 objectForKey:[HospitalName_ParserDelegate description]];
           
           return [hosptial1 caseInsensitiveCompare:hosptial2];
       }];
       // Populate arrays.
       self.displayArray = [self.fetchedResultsArray mutableCopy];
       
       // Check searchbar for contents.
       if ([self.searchBar.text isEqualToString:EMPTY_STRING]) {
#warning Incomplete implementation.
       }
        
        // Return to main thread to update the UI.
        dispatch_async(dispatch_get_main_queue(), ^{
            // Reload the table cells.
            [self.tableView reloadData];
            // Stop activity indicator.
            [self.activityIndicator stopAnimating];
        });
   });
}

#pragma mark -UITableViewDelegate


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"segueToDetailController"]) {
        if ([segue.destinationViewController isKindOfClass:[HospitalItemDetailsViewController class]]) {
            // Setup controller before segue.
            HospitalItemDetailsViewController *hospitalDetailController = (HospitalItemDetailsViewController *)segue.destinationViewController;
            // Retrieve the index of the selected table row.
            NSIndexPath *indexPath = [self.tableView indexPathForCell:((UITableViewCell *)sender)];
            // Pass the selected item.
            hospitalDetailController.passedItem = self.displayArray[indexPath.row];
        }
    }
}

#pragma mark -Search Bar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    self.displayArray = nil;
    self.displayArray = [[NSMutableArray alloc] initWithArray:self.fetchedResultsArray];
    searchBar.text = @"";
    [self.tableView reloadData];
    
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        NSMutableArray *tempArrayOfResults = [[NSMutableArray alloc] init];
        
        NSRange stringRange = NSMakeRange(0, searchBar.text.length);
        
        for (NSDictionary *dictionary in self.fetchedResultsArray) {
            // Retrieve the object for compairison.
            NSString *term = [dictionary objectForKey:[HospitalName_ParserDelegate description]];
            if ([term compare:searchText options:NSCaseInsensitiveSearch range:stringRange] == NSOrderedSame) {
                // add term to mutable array...
                [tempArrayOfResults addObject:dictionary];
            }
        }
        
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            self.displayArray = [[NSMutableArray alloc] initWithArray:tempArrayOfResults];
            [self.tableView reloadData];
        });
    });
}

@end
