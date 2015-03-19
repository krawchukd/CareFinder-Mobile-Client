//
//  ClientProtocol.h
//  CareFinder
//
//  Created by David Krawchuk on 3/3/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParserDelegate.h"
#import "URLConstants.h"

@protocol ClientProtocol <NSObject, NSURLSessionDownloadDelegate, NSURLConnectionDelegate, NSURLSessionDelegate>
@optional
@property (nonatomic, strong) id<ParserDelegate> delegate;
@property (nonatomic, strong) id<ClientParserCoordinatorProtocol> coordinator;

@property  (nonatomic, strong) NSMutableDictionary *dictionaryOfItems;
@property  (nonatomic, strong) NSMutableArray *parsedArray;

@property (nonatomic, strong) NSURLSession *backgroundSession;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, weak) NSURLSessionConfiguration *backgroundSessionConfiguration;
@property (nonatomic, weak) NSURLSessionConfiguration *defaultSessionConfiguration;

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location;

@end
