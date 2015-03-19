//
//  ParserDelegate.h
//  CareFinder
//
//  Created by David Krawchuk on 3/3/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClientParserCoordinatorProtocol.h"

@protocol ParserDelegate <NSObject, NSXMLParserDelegate>

@required
@property (nonatomic, weak) id<ClientParserCoordinatorProtocol> source;

@optional
@property (nonatomic, weak) NSMutableDictionary *passedItemDictionary;
@property (nonatomic, weak) NSMutableArray *passedArrayOfItems;
@property (nonatomic, weak) NSMutableString *contents;

-(void)source:(id<ClientParserCoordinatorProtocol>)source withArrayOfItems:(NSMutableArray *)passedArray;
-(void)source:(id<ClientParserCoordinatorProtocol>)source withDictionary:(NSMutableDictionary  *)dictionary;
-(void)source:(id<ClientParserCoordinatorProtocol>)source withArrayOfItems:(NSMutableArray *)passedArray withDictionary:(NSMutableDictionary *)dictionary;


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

@required
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