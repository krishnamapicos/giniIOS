//
//  Config.h
//  WhatzzApp
//
//  Created by Konstant on 22/05/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


#import <Foundation/Foundation.h>



@interface Config : NSObject {

}

//configuration section... 

extern  NSString		*SiteAPIURL;
extern  NSString		*localAPI;

extern  NSString        *userName;
extern  NSString        *passWord;
extern  NSString        *privacy;
extern  NSString        *sid;

extern  float           CurrentLatitude;
extern  float           CurrentLongitude;
extern  int             totalPoints;
extern  int              localNotifIntervalTime;



/**
 Device tocken for push notification
 */
extern NSString *userDeviceToken;
extern  NSString *language_id;
extern  NSMutableArray *filterDataArr;


@end
