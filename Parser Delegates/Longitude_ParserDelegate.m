//
//  Longitude_ParserDelegate.m
//  CareFinder
//
//  Created by David Krawchuk on 3/3/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "Longitude_ParserDelegate.h"

@implementation Longitude_ParserDelegate

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
        [[self.source xmlParser] setDelegate:nextElement];
    }
    else
        NSLog(@"Error at %@ end element", self.description);
}

- (NSString *)description
{
    return @"longitude";
}

+ (NSString *)description{
    return @"longitude";
}
@end
