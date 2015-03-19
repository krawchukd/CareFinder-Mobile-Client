//
//  ClientParserCoordinator.h
//  CareFinder
//
//  Created by David Krawchuk on 3/4/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClientParserCoordinatorProtocol.h"
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



@interface ClientParserCoordinator : NSObject < ClientParserCoordinatorProtocol>
@property (nonatomic, strong) NSDictionary *parseMap;
@property (nonatomic, strong) NSXMLParser *xmlParser;
@property (nonatomic, strong) NSMutableArray *arrayOfItems;
@property (nonatomic, weak) id<ClientParserCoordinatorProtocol> source;

-(instancetype)initWithContentLocation:(NSURL *)location;
@end
