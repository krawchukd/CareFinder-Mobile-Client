//
//  KeyParser.h
//  CareFinder
//
//  Created by David Krawchuk on 3/3/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParserDelegate.h"

@interface KeyParser : NSObject<ParserDelegate>
@property (nonatomic, weak) id<ClientParserCoordinatorProtocol> source;
@property (nonatomic, strong, readonly) NSMutableDictionary *dictionaryOfElements;
@property (nonatomic, strong, readonly) NSMutableArray *treeOfElements;
@end
