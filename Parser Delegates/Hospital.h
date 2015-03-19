//
//  Hospital.h
//  CareFinder
//
//  Created by David Krawchuk on 3/6/15.
//  Copyright (c) 2015 David Krawchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClientProtocol.h"
#import "ClientParserCoordinator.h"
#import "URLConstants.h"

@interface Hospital : NSObject <ClientProtocol>
@property  (nonatomic, strong) NSMutableDictionary *dictionaryOfItems;
@property  (nonatomic, strong) NSMutableArray *parsedArray;
@property  (nonatomic, strong) id<ClientParserCoordinatorProtocol> coordinator;

@property (nonatomic, strong) NSURLSession *backgroundSession;
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, weak) NSURLSessionConfiguration *backgroundSessionConfiguration;
@property (nonatomic, weak) NSURLSessionConfiguration *defaultSessionConfiguration;
@property (nonatomic, weak) NSOperationQueue *downloadOperationQueue;
@property (nonatomic, weak) NSString *apiKey;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Default initializer.
 */
- (instancetype) initWithBackgroundSessionConfiguration:(NSURLSessionConfiguration *)backgroundSessionConfiguration
                         andDefaultSessionConfiguration:(NSURLSessionConfiguration *)defaultSessionConfiguration
                                 downloadOperationQueue:(NSOperationQueue *)operationQueue
                                                 apiKey:(NSString*)apiKey;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  URLSession download callback. Called when the download task has finished.
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Called to fetch all hospitals from the server. Boolean value determines use of cached results.
 */
- (void)fetchAllHospitalsForceDownload:(BOOL)forceDownload;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Get a hospital based on its unique identifier
 */
- (void)fetchHospitalWithUniqueID:(NSNumber *)identifier ForceDownload:(BOOL)forceDownload;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Get a hospital based on city name.
 */
- (void)fetchHospitalsWithCity:(NSString*)city ForceDownload:(BOOL)forceDownload;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Get a hospital based on state name.
 */
- (void)fetchHospitalsWithState:(NSString *)state ForceDownload:(BOOL)forceDownload;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Get a hospital based on county name.
 */
- (void)fetchHospitalsWithCounty:(NSString *)county ForceDownload:(BOOL)forceDownload;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Get a hospital based on city/state name combination.
 */
- (void)fetchHospitalsWithCity:(NSString *)city
                     WithState:(NSString *)state
                 ForceDownload:(BOOL)forceDownload;

/* @Author: David Krawchuk
 * @Date Created:
 * @Date Altered:
 *
 * Description:
 *  Get a hospital based on the hospital's name.
 */
- (void)fetchHospitalsWithName:(NSString *)name ForceDownload:(BOOL)forceDownload;

@end
