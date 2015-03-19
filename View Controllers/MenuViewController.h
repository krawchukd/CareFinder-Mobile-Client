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
 
 @class MenuViewController
 @abstract Main Menu View Controller.
 @discussion Main Menu View Controller is the starting point for user interaction with the application.
 @updated 03-09-2015
 
 */

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

/*!
 @method prepareForSegue:sender:
 @abstract Controller lifecycle callback.
 @discussion Method is called prior to segue to another storyboard, so that any initialization that is
                required can be performed.
 @param segue The seque object, contains the identifier and destination object.
 @param sender The object that triggered the segue.
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
