//
//  Item_ParserDelegate.h
//  CareFinder
//
//  Created by David Krawchuk on 3/3/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parser_Template.h"

@interface Item_ParserDelegate : Parser_Template
@property (nonatomic, weak) NSMutableArray *passedArrayOfItems;
@property (nonatomic, weak) id<ClientParserCoordinatorProtocol> source;
@end
