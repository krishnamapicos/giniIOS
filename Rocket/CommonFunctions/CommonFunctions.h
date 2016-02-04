//
//  CommonFunctions.h
//  BaitiApp
//
//  Created by Shweta Rao on 27/03/15.
//  Copyright (c) 2015 Shweta Rao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
//#import "AppDelegate.h"
#import "MBProgressHUD.h"
//#import "AFNetworking.h"
//#import "ConnectionManager.h"

#define     SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
@interface CommonFunctions : NSObject

+ (void)customizeNavigationController:(UINavigationController *)navController withImage:(NSString*)image andTintColor:(UIColor *)color;

//+(void) setNavigationBar:(UINavigationController*)navController setNavItem:(UINavigationItem *)navItem ;
+(void)alertTitle:(NSString*)aTitle withMessage:(NSString*)aMsg;
+ (void)alertTitle:(NSString*)aTitle withMessage:(NSString*)aMsg withDelegate:(id)delegate;

+(void) setNavigationBar:(UINavigationController*)navController;
+(NSString *)trimSpaceInString:(NSString *)mainstr;
+ (void)showActivityIndicatorWithText:(NSString *)text setView :(UIView *)view;
+ (void)removeActivityIndicator:(UIView*)view;
+ (void)alertTitle:(NSString*)aTitle withMessage:(NSString*)aMsg BtnTitle:(NSString*)btnName withDelegate:(id)delegate;
+(BOOL) reachabiltyCheck;
+ (BOOL)isValueNotEmpty:(NSString*)aString;
+(BOOL)IsValidEmail:(NSString *)checkString;

+(NSDate *)convertDateFromGMTFormat:(NSString *)date;

+ (void)alertArabicTitle:(NSString*)aTitle withMessage:(NSString*)aMsg;

+ (void)alertTitle:(NSString*)aTitle withMessage:(NSString*)aMsg withDelegate:(id)delegate withTag:(int)tag;
+ (void)alertTitleArabic:(NSString*)aTitle withMessage:(NSString*)aMsg withDelegate:(id)delegate withTag:(int)tag;
+ (void) showHUDWithLabel:(NSString *)messageLabel ForNavigationController:(UINavigationController *) navController;
@end
