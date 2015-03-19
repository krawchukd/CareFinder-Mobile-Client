//
//  HospitalItemDetailsViewController.m
//  CareFinder
//
//  Created by David Krawchuk on 3/8/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "HospitalItemDetailsViewController.h"
#import "Item_ParserDelegate.h"
#import "Provider_ID_ParserDelegate.h"
#import "HospitalName_ParserDelegate.h"
#import "Address_ParserDelegate.h"
#import "City_ParserDelegate.h"
#import "State_ParserDelegate.h"
#import "Zip_Code_ParserDelegate.h"
#import "CountyName_ParserDelegate.h"
#import "PhoneNumber_ParserDelegate.h"
#import "HospitalType_ParserDelegate.h"
#import "HospitalOwnership_ParserDelegate.h"
#import "EmergencyServices_ParserDelegate.h"
#import "HumanAddress_ParserDelegate.h"
#import "Latitude_ParserDelegate.h"
#import "Longitude_ParserDelegate.h"

@interface HospitalItemDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation HospitalItemDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createViewableTextFromPassedItem];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.textView scrollRectToVisible:CGRectZero animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createViewableTextFromPassedItem{
    NSString *passedItemContentString =
        [NSString stringWithFormat:@"Hospital name:\r%@\r\rHospital type:\r%@\r\rPhone number:\r%@\r\rProvider ID:\r%@\r\rAddress:\r%@ %@ %@ %@\r\r\rHospital Ownership:\r%@\r\rEmergency Service:\r%@\r\rLatitude:\r%@\r\rLongitude:\r%@",
         [self.passedItem objectForKey:[HospitalName_ParserDelegate description]],
         [self.passedItem objectForKey:[HospitalType_ParserDelegate description]],
         [self.passedItem objectForKey:[PhoneNumber_ParserDelegate description]],
         [self.passedItem objectForKey:[Provider_ID_ParserDelegate description]],
         [self.passedItem objectForKey:[Address_ParserDelegate description]],
         [self.passedItem objectForKey:[City_ParserDelegate description]],
         [self.passedItem objectForKey:[State_ParserDelegate description]],
         [self.passedItem objectForKey:[Zip_Code_ParserDelegate description]],
         [self.passedItem objectForKey:[HospitalOwnership_ParserDelegate description]],
         [self.passedItem objectForKey:[EmergencyServices_ParserDelegate description]],
         [self.passedItem objectForKey:[Latitude_ParserDelegate description]],
         [self.passedItem objectForKey:[Longitude_ParserDelegate description]]];
    
    // Populate the textView with the contents of the created string.
    self.textView.text = passedItemContentString;
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
