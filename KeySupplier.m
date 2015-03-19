//
//  KeySupplier.m
//  CareFinder
//
//  Created by David Krawchuk on 3/5/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import "KeySupplier.h"

@interface KeySupplier ()
@property (nonatomic, strong) NSString *saveKey;
@property (nonatomic, strong) NSString *storedKey;
@end
@implementation KeySupplier

#pragma mark -Init Methods
- (instancetype) initWithBackgroundSessionConfiguration:(NSURLSessionConfiguration *)backgroundSessionConfiguration
                         defaultSessionConfiguration:(NSURLSessionConfiguration *)defaultSessionConfiguration operationQueue:(NSOperationQueue *)operationQueue {
    if (self = [super init]) {
        _backgroundSessionConfiguration = backgroundSessionConfiguration;
        _defaultSessionConfiguration = defaultSessionConfiguration;
        _downloadOperationQueue = operationQueue;
    }
    return self;
}

#pragma mark -Session Methods
- (NSURLSession *)defaultSession{
    if (!_defaultSession) {
        _defaultSession = [NSURLSession sessionWithConfiguration:self.defaultSessionConfiguration delegate:self delegateQueue:nil];
    }
    return _defaultSession;
}

- (NSURLSession *)backgroundSession{
    if (!_backgroundSession) {
        _backgroundSession = [NSURLSession sessionWithConfiguration:self.backgroundSessionConfiguration
                                                           delegate:self
                                                      delegateQueue:nil];
    }
    return _backgroundSession;
}

#pragma mark -Setter/Getter Methods
- (NSString *)saveKey{
    if (!_saveKey) {
        _saveKey = [NSString stringWithFormat:KEY_CREATE_URL, [self.delegate.dictionaryOfElements objectForKey:@"key"]];
    }
    return _saveKey;
}

- (NSString *)storedKey{
    if (!_storedKey) {
        _storedKey = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    }
    return _storedKey;
}

- (id<ParserDelegate> )delegate{
    if (!_delegate) {
        _delegate = [[KeyParser alloc] init];
    }
    return _delegate;
}


#pragma mark -Establish Key

- (void)establishKey{
    
    // Form the appropriate URL path.
    NSURL *getKeyURL = [[NSURL alloc] initWithScheme:SCHEME
                                                host:BASE_URL
                                                path:GET_KEY_URL];
    
    // Download key from server.
    [[self.defaultSession downloadTaskWithURL:getKeyURL] resume];
}

- (void)saveKeyToUserDefaults{
    // Retrieve results from parser and set value in userdefaults for reuse.
    [[NSUserDefaults standardUserDefaults]
     setObject:[self.delegate.dictionaryOfElements objectForKey:@"key"]
     forKey:@"key"];
}

- (void)establishKeyOnServerWithKey:(NSString *)key{
    
    // Build URL.
    NSURL *saveURL = [[NSURL alloc] initWithScheme:SCHEME host:BASE_URL path:self.saveKey];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:saveURL];
    [request setHTTPMethod:HTTP_METHOD_GET];
    [request setValue:HTTP_ACCEPT_VALUE forHTTPHeaderField:HTTP_ACCEPT_HEADER];
    [request setValue:key forHTTPHeaderField:HTTP_API_KEY_HEADER];
    [[self.defaultSession dataTaskWithRequest:request
                           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                               NSLog(@"Data: %@\n Response: %@\n, Error: %@", data.description, response.description, error.description);
                           }] resume];
}

#pragma mark -URLSesstionDelegate
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location{
    
    // Create parser and store key.
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:location];
    parser.delegate = self.delegate;
    [parser parse];
    
    // Save key to server.
    [self establishKeyOnServerWithKey:[self.delegate.dictionaryOfElements objectForKey:@"key"]];
    [self saveKeyToUserDefaults];
    
    
}

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Returns the crypt key used for communiction with the server.
 */
- (NSString *)retrieveKey{
    if (!self.storedKey) {
            [self establishKey];
            NSLog(@"%@", self.storedKey);
    }
    
    return self.storedKey;
}

@end
