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
 
 @class URLConstants
 @abstract The URLConstants header contains constants used throught the program.
 @discussion
 @updated 03/09/2015
 
 */


#ifndef CareFinder_URLConstants_h
#define CareFinder_URLConstants_h

#define SCHEME @"http"
#define HTTP_METHOD_PUT @"PUT"
#define HTTP_METHOD_GET @"GET"

#define HTTP_ACCEPT_HEADER @"Accept"
#define HTTP_ACCEPT_VALUE @"application/xml"
#define HTTP_API_KEY_HEADER @"X-API-KEY"

#define BASE_URL @""
#define GET_KEY_URL @"/key/get"
#define KEY_CREATE_URL @"/key/create/%@/5/5"
#define GET_ALL_HOSPITALS_URL @"/hospitals"
#define GET_HOSPITALS_WITH_ID_URL @"/hospitals/id/%@"
#define GET_HOSPITALS_WITH_CITY_URL @"/hospitals/city/%@"
#define GET_HOSPITALS_WITH_STATE_URL @"/hospitals/state/%@"
#define GET_HOSPITALS_WITH_COUNTY_URL @"/hospitals/county/%@"
#define GET_HOSPITALS_WITH_CITY_STATE_URL @"/hospitals/citystate/%@/%@"
#define GET_HOSPITALS_WITH_NAME_URL @"/hospitals/name/%@"

#define BACKGROUND_SESSION_IDENTIFIER @"Project_Domain_Name.carefinder"
#define FETCH_ALL_NOTIFICATION_IDENTIFIER @"Project_Domain_Name.carefinder.fetch_all"
#define FETCH_BY_ID_NOTIFICATION_IDENTIFIER @"Project_Domain_Name.carefinder.fetch_id"
#define FETCH_BY_NAME_NOTIFICATION_IDENTIFIER @"Project_Domain_Name.carefinder.name"
#define FETCH_BY_CITY_NOTIFICATION_IDENTIFIER @"Project_Domain_Name.carefinder.city"
#define FETCH_BY_STATE_NOTIFICATION_IDENTIFIER @"Project_Domain_Name.carefinder.state"
#define FETCH_BY_COUNTY_NOTIFICATION_IDENTIFIER @"Project_Domain_Name.carefinder.county"
#define FETCH_BY_CITY_STATE_NOTIFICATION_IDENTIFIER @"Project_Domain_Name.carefinder.city.state"

#endif
