//
//  ClientServerCordinator.h
//  CareFinder
//
//  Created by David Krawchuk on 2/28/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLConstants.h"
#import "ClientProtocol.h"
#import "KeySupplier.h"
#import "ClientParserCoordinator.h"
#import "Hospital.h"


@interface ClientServerCordinator : NSObject
@property (nonatomic, strong) id<NSURLConnectionDelegate, NSURLSessionDelegate, ClientProtocol> activeClient;
@property (nonatomic, strong) NSURLSessionConfiguration *backgroundSessionConfiguration;
@property (nonatomic, strong) NSURLSessionConfiguration *defaultSessionConfiguration;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfActiveClients;

// Operation queue to handle download tasks.
@property (nonatomic, strong) NSOperationQueue *downloadOperationQueue;

#pragma mark -KeySupplier Client Calls

/*
 * Description:
 *  Returns key value if key exists in userdefaults, else returns nil.
 */
- (NSString *)retrieveKey;

- (Hospital *)createHospitalClient;

@end
