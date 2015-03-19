//
//  ClientParserCoordinator.m
//  CareFinder
//
//  Created by David Krawchuk on 3/4/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "ClientParserCoordinator.h"
@interface ClientParserCoordinator()
@property (nonatomic, strong) Item_ParserDelegate *item_ParserDelegate;
@property (nonatomic, strong) Provider_ID_ParserDelegate *provider_Id_ParserDelegate;
@property (nonatomic, strong) HospitalName_ParserDelegate *hospitalName_ParserDelegate;
@property (nonatomic, strong) Address_ParserDelegate *address_ParserDelegate;
@property (nonatomic, strong) City_ParserDelegate *city_ParserDelegate;
@property (nonatomic, strong) State_ParserDelegate *state_ParserDelegate;
@property (nonatomic, strong) Zip_Code_ParserDelegate *zip_ParserDelegate;
@property (nonatomic, strong) CountyName_ParserDelegate *countyName_ParserDelegate;
@property (nonatomic, strong) PhoneNumber_ParserDelegate *phoneNumber_ParserDelegate;
@property (nonatomic, strong) HospitalType_ParserDelegate *hosptialType_ParserDelegate;
@property (nonatomic, strong) HospitalOwnership_ParserDelegate *hospitalOwnership;
@property (nonatomic, strong) EmergencyServices_ParserDelegate *emergencyServices_ParserDelegate;
@property (nonatomic, strong) HumanAddress_ParserDelegate *humanAddress_ParserDelegate;
@property (nonatomic, strong) Latitude_ParserDelegate *latitude_ParserDelegate;
@property (nonatomic, strong) Longitude_ParserDelegate *logitude_ParserDelegate;
@end

@implementation ClientParserCoordinator

#pragma mark -Setter/Getter Methods
- (NSDictionary *)parseMap{
    if (!_parseMap) {
            _parseMap = @{@"xml" : @{@"prev" : self, @"next" : self.item_ParserDelegate},
                      @"item" : @{@"prev" : self, @"next" : self.provider_Id_ParserDelegate},
                      @"provider_id" : @{@"prev" : self.item_ParserDelegate, @"next" : self.hospitalName_ParserDelegate},
                      @"hospital_name" : @{@"prev" : self.provider_Id_ParserDelegate, @"next" : self.address_ParserDelegate},
                      @"address" : @{@"prev" : self.hospitalName_ParserDelegate, @"next" : self.city_ParserDelegate},
                      @"city" : @{@"prev" : self.address_ParserDelegate, @"next" : self.state_ParserDelegate},
                      @"state" : @{@"prev" : self.city_ParserDelegate, @"next" : self.zip_ParserDelegate},
                      @"zip_code" : @{@"prev" : self.state_ParserDelegate, @"next" : self.countyName_ParserDelegate},
                      @"county_name" : @{@"prev" : self.zip_ParserDelegate, @"next" : self.phoneNumber_ParserDelegate},
                      @"phone_number" : @{@"prev" : self.countyName_ParserDelegate, @"next" : self.hosptialType_ParserDelegate},
                      @"hospital_type" : @{@"prev" : self.phoneNumber_ParserDelegate, @"next" : self.hospitalOwnership},
                      @"hospital_ownership" : @{@"prev" : self.hosptialType_ParserDelegate, @"next" : self.emergencyServices_ParserDelegate},
                      @"emergency_services" : @{@"prev" : self.hospitalOwnership, @"next" : self.humanAddress_ParserDelegate},
                      @"human_address" : @{@"prev" : self.emergencyServices_ParserDelegate, @"next" : self.latitude_ParserDelegate},
                      @"latitude" : @{@"prev" : self.humanAddress_ParserDelegate, @"next" : self.logitude_ParserDelegate},
                      @"longitude" : @{@"prev" : self.latitude_ParserDelegate, @"next" : self.item_ParserDelegate}};
        
    }
    return _parseMap;
}

-(NSMutableArray *)arrayOfItems{
    if (!_arrayOfItems) {
        _arrayOfItems = [[NSMutableArray alloc] init];
    }
    return _arrayOfItems;
}

-(Item_ParserDelegate *)item_ParserDelegate{
    if (!_item_ParserDelegate) {
        _item_ParserDelegate = [[Item_ParserDelegate alloc] init];
    }
    return _item_ParserDelegate;
}

-(Provider_ID_ParserDelegate *)provider_Id_ParserDelegate{
    if (!_provider_Id_ParserDelegate) {
        _provider_Id_ParserDelegate = [[Provider_ID_ParserDelegate alloc] init];
    }
    return _provider_Id_ParserDelegate;
}

- (HospitalName_ParserDelegate *)hospitalName_ParserDelegate{
    if (!_hospitalName_ParserDelegate) {
        _hospitalName_ParserDelegate = [[HospitalName_ParserDelegate alloc] init];
    }
    return _hospitalName_ParserDelegate;
}

-(Address_ParserDelegate *)address_ParserDelegate{
    if (!_address_ParserDelegate) {
        _address_ParserDelegate = [[Address_ParserDelegate alloc] init];
    }
    return _address_ParserDelegate;
}

-(City_ParserDelegate *)city_ParserDelegate{
    if (!_city_ParserDelegate) {
        _city_ParserDelegate = [[City_ParserDelegate alloc] init];
    }
    return _city_ParserDelegate;
}

-(State_ParserDelegate *)state_ParserDelegate{
    if (!_state_ParserDelegate) {
        _state_ParserDelegate = [[State_ParserDelegate alloc] init];
    }
    return _state_ParserDelegate;
}

-(Zip_Code_ParserDelegate *)zip_ParserDelegate{
    if (!_zip_ParserDelegate) {
        _zip_ParserDelegate = [[Zip_Code_ParserDelegate alloc] init];
    }
    return _zip_ParserDelegate;
}

-(CountyName_ParserDelegate *)countyName_ParserDelegate{
    if (!_countyName_ParserDelegate) {
        _countyName_ParserDelegate = [[CountyName_ParserDelegate alloc] init];
    }
    return _countyName_ParserDelegate;
}

-(PhoneNumber_ParserDelegate *)phoneNumber_ParserDelegate{
    if (!_phoneNumber_ParserDelegate) {
        _phoneNumber_ParserDelegate = [[PhoneNumber_ParserDelegate alloc] init];
    }
    return _phoneNumber_ParserDelegate;
}

-(HospitalType_ParserDelegate *)hosptialType_ParserDelegate{
    if (!_hosptialType_ParserDelegate) {
        _hosptialType_ParserDelegate = [[HospitalType_ParserDelegate alloc] init];
    }
    return  _hosptialType_ParserDelegate;
}

-(HospitalOwnership_ParserDelegate *)hospitalOwnership{
    if (!_hospitalOwnership) {
        _hospitalOwnership = [[HospitalOwnership_ParserDelegate alloc] init];
    }
    return _hospitalOwnership;
}

-(EmergencyServices_ParserDelegate *)emergencyServices_ParserDelegate{
    if (!_emergencyServices_ParserDelegate) {
        _emergencyServices_ParserDelegate = [[EmergencyServices_ParserDelegate alloc] init];
    }
    return _emergencyServices_ParserDelegate;
}

-(HumanAddress_ParserDelegate *)humanAddress_ParserDelegate{
    if (!_humanAddress_ParserDelegate) {
        _humanAddress_ParserDelegate = [[HumanAddress_ParserDelegate alloc]init];
    }
    return _humanAddress_ParserDelegate;
}

-(Latitude_ParserDelegate *)latitude_ParserDelegate{
    if (!_latitude_ParserDelegate) {
        _latitude_ParserDelegate = [[Latitude_ParserDelegate alloc] init];
    }
    return _latitude_ParserDelegate;
}

-(Longitude_ParserDelegate *)logitude_ParserDelegate{
    if (!_logitude_ParserDelegate) {
        _logitude_ParserDelegate = [[Longitude_ParserDelegate alloc] init];
    }
    return _logitude_ParserDelegate;
}

#pragma mark -Init Methods
-(instancetype)initWithContentLocation:(NSURL *)location{
    if (self = [super init]) {
        self.source = self;
        self.xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:location];
        self.xmlParser.delegate = self;
    }
    return self;
}

#pragma mark -ParserDelegate Methods

/*
 * Description:
 *  Called by the source object as each new element begin tag is encountered.
 */
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"xml"]) {
        NSDictionary *pnDictionary = [self.parseMap objectForKey:elementName];
        id<ParserDelegate> nextParser = [pnDictionary objectForKey:@"next"];
        [nextParser source:self withArrayOfItems:self.arrayOfItems];
        [[self.source xmlParser] setDelegate:nextParser];

    }
}

/*
 * Description:
 *  Called by the source object as each elements end tag is encountered.
 */
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    
}

/*
 * Description:
 *  Called by the source object as each element's contents are read. The read
 *   contents are passed as a string.
 *
 *  Note : Can be called multiple times for each element.
 */
- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string{
    
}

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Sent by a parser object to its delegate when it encounters a fatal error.
 */
- (void)parser:(NSXMLParser *)parser
parseErrorOccurred:(NSError *)parseError
{
    
}

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Reported by a parser object to provide its delegate with a string representing all or part of the ignorable
 *   whitespace characters of the current element.
 */
- (void)parser:(NSXMLParser *)parser
foundIgnorableWhitespace:(NSString *)whitespaceString{
    
}


@end
