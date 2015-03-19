/*!
 
    Copyright (c) <2015> <David Krawchuk> All rights reserved.
 
    Permission is hereby granted, free of charge, to any person obtaining a copy of this software
        and associated documentation files (the "Software"), to deal in the Software without restriction,
        including without limitation the rights to use, copy, modify, merge, publish, distribute,
        sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
        is furnished to do so, subject to the following conditions:
 
        The above copyright notice and this permission notice shall be included in all copies or
        substantial portions of the Software.
 
        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
        NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
        NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
        OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
        CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
    @class AppDelegate
    @abstract Central control object for IOS Applications.
    @discussion Central control object for IOS Applications. Contains the callback methods for the Application
                    lifecycle.
    @updated 03/09/2015
 
 */

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ClientServerCordinator.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/*! @see ClientServerCoordinator.h */
@property (nonatomic, strong) ClientServerCordinator *clientServerCordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

