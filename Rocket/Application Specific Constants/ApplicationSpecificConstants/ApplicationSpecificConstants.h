//
//  Fast Packout
//
//  Created by Alok on 07/10/13.
//  Copyright (c) 2013 Konstant Info Private Limited. All rights reserved.
//

#ifndef ApplicationSpecificConstants_h
#define ApplicationSpecificConstants_h

/**
 Constants:-

 This header file holds all configurable constants specific  to this application.

 */

////////////////////////////////////////SOME MACROS TO MAKE YOUR PROGRAMING LIFE EASIER/////////////////////////////////////////

/**
 return if no internet connection is available with and without error message
 */
#define RETURN_IF_NO_INTERNET_AVAILABLE_WITH_USER_WARNING if (![CommonFunctions getStatusForNetworkConnectionAndShowUnavailabilityMessage:YES]) return;
#define RETURN_IF_NO_INTERNET_AVAILABLE                   if (![CommonFunctions getStatusForNetworkConnectionAndShowUnavailabilityMessage:NO]) return;


#define METHOD_IMPLEMENTATION_FOR_INITIALIZATION_PLUS_DEALLOC_PLUS_MEMORY_WARNING \
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {\
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];            \
if (self) {                                                                       \
	}                                                                             \
	return self;                                                                  \
}                                                                                 \
- (id)init {                                                                      \
	self = [super init];                                                          \
	if (self) {                                                                   \
	}                                                                             \
	return self;                                                                  \
}                                                                                 \
- (void)dealloc {                                                                 \
	[[NSNotificationCenter defaultCenter]removeObserver:self];                    \
}                                                                                 \
- (void)didReceiveMemoryWarning {                                                 \
	[super didReceiveMemoryWarning];                                              \
}                                                                                 \


/**
 get status of internet connection
 */
#define IS_INTERNET_AVAILABLE_WITH_USER_WARNING           [CommonFunctions performSelectorOnMainThread:@selector(getStatusForNetworkConnectionAndShowUnavailabilityMessage:) withObject:YES waitUntilDone:NO];
#define IS_INTERNET_AVAILABLE                             [CommonFunctions performSelectorOnMainThread:@selector(getStatusForNetworkConnectionAndShowUnavailabilityMessage:) withObject:NO waitUntilDone:NO];

#define SHOW_SERVER_NOT_RESPONDING_MESSAGE                [CommonFunctions performSelectorOnMainThread:@selector(showServerNotFoundError) withObject:nil waitUntilDone:NO];


#define MIN_DUR 2

#define SID @"sid"
#define USER_ID @"userId"

#define ID @"id"
#define CLIENT_ID @"clientId"

//FREQUENTLY USED OBJECT AND KEYS

#define DataFilePath                [@"~/Documents/Username_Password.plist" stringByStandardizingPath]

#endif
