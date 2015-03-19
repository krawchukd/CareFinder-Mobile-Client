//
//  ClientServerCordinator.m
//  CareFinder
//
//  Created by David Krawchuk on 2/28/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "ClientServerCordinator.h"


@interface ClientServerCordinator ()
@property (nonatomic, strong) NSMutableDictionary *completionHandlerDictionary;
@end

@implementation ClientServerCordinator

#pragma mark -Setter/Getter Methods
- (NSMutableDictionary *)dictionaryOfActiveClients{
    if (!_dictionaryOfActiveClients) {
        _dictionaryOfActiveClients = [[NSMutableDictionary alloc] init];
    }
    return _dictionaryOfActiveClients;
}

- (void)setActiveClient:(id<NSURLConnectionDelegate,NSURLSessionDelegate,ClientProtocol>)activeClient{
    [self.dictionaryOfActiveClients setObject:activeClient forKey:[NSString stringWithFormat:@"%lu",(unsigned long)[activeClient hash]]];
}

- (NSOperationQueue *)downloadOperationQueue{
    if (!_downloadOperationQueue) {
        _downloadOperationQueue = [[NSOperationQueue alloc] init];
    }
    return _downloadOperationQueue;
}

#pragma mark -Session Configuration Methods
- (NSURLSessionConfiguration *)backgroundSessionConfiguration{
    if (!_backgroundSessionConfiguration) {
        _backgroundSessionConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier: BACKGROUND_SESSION_IDENTIFIER];
    }
    return _backgroundSessionConfiguration;
}

- (NSURLSessionConfiguration *)defaultSessionConfiguration{
    if (!_defaultSessionConfiguration) {
        _defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    }
    return _defaultSessionConfiguration;
}

#pragma mark -Client Server Mapping Methods
- (NSString *)retrieveKey{

#warning Implement checking dictionary contents.
    
    // Create supplier and set active client.
    KeySupplier *supplier = [[KeySupplier alloc] initWithBackgroundSessionConfiguration:self.backgroundSessionConfiguration defaultSessionConfiguration:self.defaultSessionConfiguration operationQueue:self.downloadOperationQueue];
    self.activeClient = supplier;
    
    
    return [supplier retrieveKey];
}

- (Hospital *)createHospitalClient{
    Hospital *hospital = [[Hospital alloc] initWithBackgroundSessionConfiguration:self.backgroundSessionConfiguration
                                                  andDefaultSessionConfiguration:self.defaultSessionConfiguration
                                                          downloadOperationQueue:self.downloadOperationQueue
                                                                          apiKey:self.retrieveKey];
    self.activeClient = hospital;
    
    return hospital;
}
@end









