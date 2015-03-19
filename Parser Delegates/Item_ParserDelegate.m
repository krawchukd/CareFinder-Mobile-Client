//
//  Item_ParserDelegate.m
//  CareFinder
//
//  Created by David Krawchuk on 3/3/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "Item_ParserDelegate.h"

@interface Item_ParserDelegate ()
@end
@implementation Item_ParserDelegate

#pragma mark -ParserDelegate Methods
-(void)source:(id<ClientParserCoordinatorProtocol>)source withArrayOfItems:(NSMutableArray *)passedArray{
    
    // Set properties.
    self.source = source;
    self.passedArrayOfItems = passedArray;
}

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
    /* 1. Add dictionary to the array of items.
     * 2. Pass delegate duties to next element.
     */
    if ([elementName isEqualToString:self.description]) {
        [self.passedArrayOfItems addObject:[NSMutableDictionary dictionary]];
        
        id<ParserDelegate> nextElement = [[[self.source parseMap] objectForKey:self.description] objectForKey:@"next"];
        [nextElement source:self.source withDictionary:[self.passedArrayOfItems lastObject]];
        [[self.source xmlParser] setDelegate:nextElement];
    }
    else
        NSLog(@"Error at %@ start element", self.description);
}

/*
 * Description:
 *  Called by the source object as each elements end tag is encountered.
 */
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName{
    if (elementName) {
        
    }
}

- (NSString *)description{
    return @"item";
}

+ (NSString *)description{
    return @"item";
}
@end
