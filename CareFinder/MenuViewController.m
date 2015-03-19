//
//  MenuViewController.m
//  CareFinder
//
//  Created by David Krawchuk on 2/28/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "MenuViewController.h"
#import "FindAllHosptialsViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

#pragma mark - Navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"segue_to_all_hospitals"]) {
        if ([segue.destinationViewController isKindOfClass:[FindAllHosptialsViewController class]]) {
            FindAllHosptialsViewController *findAllHospitalViewControllers = (FindAllHosptialsViewController *)segue.destinationViewController;
            
            // Create client and fetch the results.
            [[findAllHospitalViewControllers.clientServerCoordinator createHospitalClient] fetchAllHospitalsForceDownload:YES];
        }
    }
}

@end
