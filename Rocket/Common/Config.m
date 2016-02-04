//
//  Config.M
//  WhatzzApp
//
//  Created by Konstant on 22/05/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "Config.h"


@implementation Config

//NSString		*SiteURL				= @"";

NSString		*SiteAPIURL				= @"http://128.199.234.43:";


NSString		*localAPI				= @"http://192.168.1.34:";


NSString		*ShowPerPage			= @"20";


NSString        *userName               = @"";
NSString        *passWord               = @"";
NSString        *sid                    = @"";
;
NSString        *titlenotication;
BOOL            isRegularUser;
BOOL            canSwipe;
BOOL            emptyRecord;

float           CurrentLatitude;
float           CurrentLongitude;

int             totalPoints = 0;
int             localNotifIntervalTime;
/**
 Device tocken for push notification
 */
NSString *userDeviceToken;
NSString *language_id=@"en";
NSMutableArray *filterDataArr;

@end