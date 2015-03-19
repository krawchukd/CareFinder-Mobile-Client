//
//  Parser_Item_Child_Template.m
//  CareFinder
//
//  Created by David Krawchuk on 3/7/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "Parser_Item_Child_Template.h"

@implementation Parser_Item_Child_Template

-(void)source:(id<ClientParserCoordinatorProtocol>)source withDictionary:(NSMutableDictionary *)dictionary{
    
    // Set properties.
    self.source = source;
    self.passedItemDictionary = dictionary;
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
    // Create string to fill with contents of xml element.
    if ([elementName isEqualToString:self.description]) {
        [self.passedItemDictionary setObject:[[NSMutableString alloc] init] forKey:self.description];
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
 qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:self.description]) {
        id<ParserDelegate> nextElement = [[[self.source parseMap] objectForKey:self.description] objectForKey:@"next"];
        [nextElement source:self.source withDictionary:self.passedItemDictionary];
        [[self.source xmlParser] setDelegate:nextElement];
    }
    else
        NSLog(@"Error at %@ end element", self.description);
}

- (NSString *)description{
    return @"item_child_template_element";
}

@end
