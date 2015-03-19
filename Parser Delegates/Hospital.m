//
//  Hospital.m
//  CareFinder
//
//  Created by David Krawchuk on 3/6/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "Hospital.h"

@implementation Hospital

#pragma mark -Init Methods
- (instancetype) initWithBackgroundSessionConfiguration:(NSURLSessionConfiguration *)backgroundSessionConfiguration
                         andDefaultSessionConfiguration:(NSURLSessionConfiguration *)defaultSessionConfiguration
                                 downloadOperationQueue:(NSOperationQueue *)operationQueue
                                                 apiKey:(NSString*)apiKey{
    if (self = [super init]) {
        self.backgroundSessionConfiguration = backgroundSessionConfiguration;
        self.defaultSessionConfiguration = defaultSessionConfiguration;
        self.downloadOperationQueue = operationQueue;
        self.apiKey = apiKey;
    }
    return self;
}


#pragma mark -Session Methods
- (NSURLSession *)defaultSession{
    if (!_defaultSession) {
        _defaultSession = [NSURLSession sessionWithConfiguration:self.defaultSessionConfiguration delegate:self delegateQueue:self.downloadOperationQueue];
    }
    return _defaultSession;
}

- (NSURLSession *)backgroundSession{
    if (!_backgroundSession) {
        _backgroundSession = [NSURLSession sessionWithConfiguration:self.backgroundSessionConfiguration
                                                           delegate:self
                                                      delegateQueue:self.downloadOperationQueue];
    }
    return _backgroundSession;
}

#pragma mark -URLSesstionDelegate
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
    self.coordinator = [[ClientParserCoordinator alloc] initWithContentLocation:location];
    [[self.coordinator xmlParser] parse];

#warning Implement handler.
    NSLog(@"%@", [self.coordinator arrayOfItems]);
}

#pragma mark -Client Interface Methods
- (void)fetchAllHospitalsForceDownload:(BOOL)forceDownload{
    if (forceDownload) {
        // Request all hosptials URL.
        NSURL *url = [[NSURL alloc] initWithScheme:SCHEME host:BASE_URL path:GET_ALL_HOSPITALS_URL];
        
        // Create request and populate header fields.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:HTTP_METHOD_GET];
        [request addValue:HTTP_ACCEPT_VALUE forHTTPHeaderField:HTTP_ACCEPT_HEADER];
        [request addValue:self.apiKey forHTTPHeaderField:HTTP_API_KEY_HEADER];
        
        [[self.defaultSession downloadTaskWithRequest:request
                                    completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                        // Create coordinator and parse results.
                                        self.coordinator = [[ClientParserCoordinator alloc] initWithContentLocation:location];
                                        [[self.coordinator xmlParser] parse];
                                       
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            
                                                // Send notification.
                                                [[NSNotificationCenter defaultCenter] postNotificationName:FETCH_ALL_NOTIFICATION_IDENTIFIER
                                                                                                    object:self
                                                                                                  userInfo:@{@"client" : self,
                                                                                                             @"coordinator" : self.coordinator}];
                                            });
                                        
                                    }] resume];
    }

    else
    {
        #warning Implement handler for core data.

    }
}

- (void)fetchHospitalWithUniqueID:(NSNumber *)identifier ForceDownload:(BOOL)forceDownload{
    if (forceDownload) {
        NSURL *url = [[NSURL alloc] initWithScheme:SCHEME host:BASE_URL path:[NSString stringWithFormat:GET_HOSPITALS_WITH_ID_URL, identifier]];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:HTTP_METHOD_GET];
        [request addValue:HTTP_ACCEPT_VALUE forHTTPHeaderField:HTTP_ACCEPT_HEADER];
        [request addValue:self.apiKey forHTTPHeaderField:HTTP_API_KEY_HEADER];
        
        [[self.defaultSession downloadTaskWithRequest:request
                                    completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                        // Create coordinator and parse results.
                                        self.coordinator = [[ClientParserCoordinator alloc] initWithContentLocation:location];
                                        [[self.coordinator xmlParser] parse];
                                        
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            
                                            // Send notification.
                                            [[NSNotificationCenter defaultCenter] postNotificationName:FETCH_BY_ID_NOTIFICATION_IDENTIFIER
                                                                                                object:self
                                                                                              userInfo:@{@"client" : self,
                                                                                                         @"coordinator" : self.coordinator}];
                                        });
                                        
                                    }] resume];
    }
    else
    {
#warning Implement handler for core data.
        
    }
}

- (void)fetchHospitalsWithCity:(NSString*)city ForceDownload:(BOOL)forceDownload{
    if (forceDownload) {
        
        NSURL *url = [[NSURL alloc] initWithScheme:SCHEME host:BASE_URL path:[NSString stringWithFormat:GET_HOSPITALS_WITH_CITY_URL, city]];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:HTTP_METHOD_GET];
        [request addValue:HTTP_ACCEPT_VALUE forHTTPHeaderField:HTTP_ACCEPT_HEADER];
        [request addValue:self.apiKey forHTTPHeaderField:HTTP_API_KEY_HEADER];
        
        [[self.defaultSession downloadTaskWithRequest:request
                                    completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                        // Create coordinator and parse results.
                                        self.coordinator = [[ClientParserCoordinator alloc] initWithContentLocation:location];
                                        [[self.coordinator xmlParser] parse];
                                        
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            
                                            // Send notification.
                                            [[NSNotificationCenter defaultCenter] postNotificationName:FETCH_BY_CITY_NOTIFICATION_IDENTIFIER
                                                                                                object:self
                                                                                              userInfo:@{@"client" : self,
                                                                                                         @"coordinator" : self.coordinator}];
                                        });
                                        
                                    }] resume];
    }
    else
    {
        #warning Implement handler for core data.
    }
    
}

- (void)fetchHospitalsWithState:(NSString *)state ForceDownload:(BOOL)forceDownload{
    if (forceDownload) {
        
        NSURL *url = [[NSURL alloc] initWithScheme:SCHEME host:BASE_URL path:[NSString stringWithFormat:GET_HOSPITALS_WITH_STATE_URL, state]];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:HTTP_METHOD_GET];
        [request addValue:HTTP_ACCEPT_VALUE forHTTPHeaderField:HTTP_ACCEPT_HEADER];
        [request addValue:self.apiKey forHTTPHeaderField:HTTP_API_KEY_HEADER];
        
        [[self.defaultSession downloadTaskWithRequest:request
                                    completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                        // Create coordinator and parse results.
                                        self.coordinator = [[ClientParserCoordinator alloc] initWithContentLocation:location];
                                        [[self.coordinator xmlParser] parse];
                                        
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            
                                            // Send notification.
                                            [[NSNotificationCenter defaultCenter] postNotificationName:FETCH_BY_STATE_NOTIFICATION_IDENTIFIER
                                                                                                object:self
                                                                                              userInfo:@{@"client" : self,
                                                                                                         @"coordinator" : self.coordinator}];
                                        });
                                        
                                    }] resume];
    }
    else
    {
        #warning Implement handler for core data.
    }
}

- (void)fetchHospitalsWithCounty:(NSString *)county ForceDownload:(BOOL)forceDownload{
    if (forceDownload) {
        
        NSURL *url = [[NSURL alloc] initWithScheme:SCHEME host:BASE_URL path:[NSString stringWithFormat:GET_HOSPITALS_WITH_COUNTY_URL, county]];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:HTTP_METHOD_GET];
        [request addValue:HTTP_ACCEPT_VALUE forHTTPHeaderField:HTTP_ACCEPT_HEADER];
        [request addValue:self.apiKey forHTTPHeaderField:HTTP_API_KEY_HEADER];
        
        [[self.defaultSession downloadTaskWithRequest:request
                                    completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                        // Create coordinator and parse results.
                                        self.coordinator = [[ClientParserCoordinator alloc] initWithContentLocation:location];
                                        [[self.coordinator xmlParser] parse];
                                        
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            
                                            // Send notification.
                                            [[NSNotificationCenter defaultCenter] postNotificationName:FETCH_BY_COUNTY_NOTIFICATION_IDENTIFIER
                                                                                                object:self
                                                                                              userInfo:@{@"client" : self,
                                                                                                         @"coordinator" : self.coordinator}];
                                        });
                                        
                                    }] resume];
    }
    else
    {
#warning Implement handler for core data.
    }
}

- (void)fetchHospitalsWithCity:(NSString *)city
                     WithState:(NSString *)state
                 ForceDownload:(BOOL)forceDownload{
        if (forceDownload) {
    
            NSURL *url = [[NSURL alloc] initWithScheme:SCHEME host:BASE_URL path:[NSString stringWithFormat:GET_HOSPITALS_WITH_CITY_STATE_URL, city, state]];
            
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
            [request setHTTPMethod:HTTP_METHOD_GET];
            [request addValue:HTTP_ACCEPT_VALUE forHTTPHeaderField:HTTP_ACCEPT_HEADER];
            [request addValue:self.apiKey forHTTPHeaderField:HTTP_API_KEY_HEADER];
            
            [[self.defaultSession downloadTaskWithRequest:request
                                        completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                            // Create coordinator and parse results.
                                            self.coordinator = [[ClientParserCoordinator alloc] initWithContentLocation:location];
                                            [[self.coordinator xmlParser] parse];
                                            
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                
                                                // Send notification.
                                                [[NSNotificationCenter defaultCenter] postNotificationName:FETCH_BY_CITY_STATE_NOTIFICATION_IDENTIFIER
                                                                                                    object:self
                                                                                                  userInfo:@{@"client" : self,
                                                                                                             @"coordinator" : self.coordinator}];
                                            });
                                            
                                        }] resume];
        }
        else
        {
            #warning Implement handler for core data.
        }
}

- (void)fetchHospitalsWithName:(NSString *)name ForceDownload:(BOOL)forceDownload{
    if (forceDownload) {
        
        NSURL *url = [[NSURL alloc] initWithScheme:SCHEME host:BASE_URL path:[NSString stringWithFormat:GET_HOSPITALS_WITH_NAME_URL, name]];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:HTTP_METHOD_GET];
        [request addValue:HTTP_ACCEPT_VALUE forHTTPHeaderField:HTTP_ACCEPT_HEADER];
        [request addValue:self.apiKey forHTTPHeaderField:HTTP_API_KEY_HEADER];
        
        [[self.defaultSession downloadTaskWithRequest:request
                                    completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                        // Create coordinator and parse results.
                                        self.coordinator = [[ClientParserCoordinator alloc] initWithContentLocation:location];
                                        [[self.coordinator xmlParser] parse];
                                        
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            
                                            // Send notification.
                                            [[NSNotificationCenter defaultCenter] postNotificationName:FETCH_BY_NAME_NOTIFICATION_IDENTIFIER
                                                                                                object:self
                                                                                              userInfo:@{@"client" : self,
                                                                                                         @"coordinator" : self.coordinator}];
                                        });
                                        
                                    }] resume];
    }
    else
    {
        
    }
}










@end
