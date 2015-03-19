//
//  ClientParserCoordinatorProtocol.h
//  CareFinder
//
//  Created by David Krawchuk on 3/4/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ClientParserCoordinatorProtocol <NSObject, NSXMLParserDelegate>
@property (nonatomic, strong) NSDictionary *parseMap;
@property (nonatomic, strong) NSXMLParser *xmlParser;
@property (nonatomic, strong) NSMutableArray *arrayOfItems;
@end
