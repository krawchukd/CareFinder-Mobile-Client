//
//  HosptialsTabBarViewController.m
//  CareFinder
//
//  Created by David Krawchuk on 3/8/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "HosptialsTabBarViewController.h"
#import "HospitalItemDetailsViewController.h"

@interface HosptialsTabBarViewController ()

@end

@implementation HosptialsTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    // Should change this to search the entire array...
    if ([[self.viewControllers firstObject] isKindOfClass:[HospitalItemDetailsViewController class]]) {
        HospitalItemDetailsViewController *detailControler = [self.viewControllers firstObject];
        detailControler.passedItem = self.passedItem;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
