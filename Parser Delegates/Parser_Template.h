//
//  Parser_Template.h
//  CareFinder
//
//  Created by David Krawchuk on 3/7/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParserDelegate.h"

@interface Parser_Template : NSObject <ParserDelegate>

@property (nonatomic, weak) id<ClientParserCoordinatorProtocol> source;
@property (nonatomic, weak) NSMutableDictionary *passedItemDictionary;
@property (nonatomic, weak) NSMutableArray *passedArrayOfItems;
@property (nonatomic, weak) NSMutableString *contents;


/*
 * Description: 
 *  Sent by the parser object to the delegate when it begins parsing a document.
 */
- (void)parserDidStartDocument:(NSXMLParser *)parser;

/*
 * Description:
 *  Sent by the parser object to the delegate when it has successfully completed parsing.
 */
- (void)parserDidEndDocument:(NSXMLParser *)parser;

/*
 * Description:
 *  Called by the source object as each new element begin tag is encountered.
 */
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict;

/*
 * Description:
 *  Called by the source object as each elements end tag is encountered.
 */
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName;


/*
 * Description:
 *  Called by the source object as each element's contents are read. The read
 *   contents are passed as a string.
 *
 *  Note : Can be called multiple times for each element.
 */
- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Sent by a parser object to its delegate when it encounters a fatal error.
 */
- (void)parser:(NSXMLParser *)parser
parseErrorOccurred:(NSError *)parseError;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Reported by a parser object to provide its delegate with a string representing all or part of the ignorable 
 *   whitespace characters of the current element.
 */
- (void)parser:(NSXMLParser *)parser
foundIgnorableWhitespace:(NSString *)whitespaceString;
@end
