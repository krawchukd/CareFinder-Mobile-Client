//
//  KeySupplier.h
//  CareFinder
//
//  Created by David Krawchuk on 3/5/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClientProtocol.h"
#import "KeyParser.h"

@interface KeySupplier : NSObject <ClientProtocol>
@property  (nonatomic, strong) NSMutableDictionary *dictionaryOfItems;
@property  (nonatomic, strong) NSMutableArray *parsedArray;
@property  (nonatomic) KeyParser *delegate;

@property (nonatomic, strong) NSURLSession *backgroundSession;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, weak) NSURLSessionConfiguration *backgroundSessionConfiguration;
@property (nonatomic, weak) NSURLSessionConfiguration *defaultSessionConfiguration;
@property (nonatomic, weak) NSOperationQueue *downloadOperationQueue;


- (instancetype) initWithBackgroundSessionConfiguration:(NSURLSessionConfiguration *)backgroundSessionConfiguration defaultSessionConfiguration:(NSURLSessionConfiguration *)defaultSessionConfiguration operationQueue:(NSOperationQueue *)operationQueue;


- (NSString *)retrieveKey;
@end
