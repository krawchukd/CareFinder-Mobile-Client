//
//  KeyParser.m
//  CareFinder
//
//  Created by David Krawchuk on 3/3/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "KeyParser.h"

@interface KeyParser ()
@property (nonatomic, strong, readwrite) NSMutableDictionary *dictionaryOfElements;
@property (nonatomic, strong, readwrite) NSMutableArray *treeOfElements;
@end
@implementation KeyParser

#pragma mark -Setter/Getter Methods
/*
 * Description: 
 *  Stores the set of key/values to be accessed by the calling object.
 */
- (NSMutableDictionary *)dictionaryOfElements{
    if (!_dictionaryOfElements) {
        _dictionaryOfElements = [[NSMutableDictionary alloc] init];
    }
    return _dictionaryOfElements;
}

/*
 * Description: 
 *  Stores the tree structure representing the xml read from input.
 */
- (NSMutableArray *)treeOfElements{
    if (!_treeOfElements) {
        _treeOfElements = [[NSMutableArray alloc] init];
    }
    return _treeOfElements;
}


#pragma mark -Parser Delegate Methods
/*
 * Description:
 *  Called by the source object as each new element begin tag is encountered.
 */
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict{
    
    // Create a node in the tree array.
    [self.treeOfElements addObject:[NSMutableArray arrayWithObjects:elementName, @"", nil]];
    
}

/*
 * Description:
 *  Called by the source object as each elements end tag is encountered.
 */
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName{
    
    NSMutableArray *kvPair = self.treeOfElements.lastObject;
    [self.dictionaryOfElements setObject:kvPair[1] forKey:kvPair[0]];
    [self.treeOfElements removeLastObject];
    
    
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
    
    // Retrieve node and insert value into the last Key-Value pair of the tree array.
    NSMutableArray *kvPair = ((NSMutableArray *)self.treeOfElements.lastObject);
    [kvPair replaceObjectAtIndex:kvPair.count - 1
                      withObject:[((NSString *)kvPair.lastObject) stringByAppendingString:string]];
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

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Sent by a parser object to its delegate when it encounters a fatal error.
 */
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    
}

@end


























