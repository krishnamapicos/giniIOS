//
//  Fast Packout
//
//  Created by Alok on 07/10/13.
//  Copyright (c) 2013 Konstant Info Private Limited. All rights reserved.
//

#ifndef ViewController_Macros_h
#define ViewController_Macros_h


#define APPDELEGATE     [AppDelegate getSharedInstance]

#define IS_HEIGHT_GTE_568 [[UIScreen mainScreen ] bounds].size.height >= 568.0f
#define IS_IPHONE_5 (IS_HEIGHT_GTE_568 )

#define RETURN_IF_THIS_VIEW_IS_NOT_A_TOPVIEW_CONTROLLER if (self.navigationController) if (!(self.navigationController.topViewController == self)) return;

#define SHOW_STATUS_BAR               [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
#define HIDE_STATUS_BAR               [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];

#define SHOW_NAVIGATION_BAR           [self.navigationController setNavigationBarHidden:FALSE];
#define HIDE_NAVIGATION_BAR           [self.navigationController setNavigationBarHidden:TRUE];

#define VC_OBJ(x) [[x alloc] init]
#define VC_OBJ_WITH_NIB(x) [[x alloc] initWithNibName : (NSString *)CFSTR(#x) bundle : nil]

#define RESIGN_KEYBOARD [UIView animateWithDuration:0.3 animations:^{[[[UIApplication sharedApplication] keyWindow] endEditing:YES];}];

#define IOS_STANDARD_COLOR_BLUE                        [UIColor colorWithHue:0.6 saturation:0.33 brightness:0.69 alpha:1]

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define FONT_REGULAR                  @"Oswald"
#define FONT_HEAVY                    @"Oswald-Light"
#define FONT_BOLD                     @"Oswald-Bold"
#define HELVETICA_NEUE                @"Helvetica Neue LT Std"

#define UD_TOKEN                        @"userToken"
#define UD_USERINFO                     @"userInfoDict"
#define UD_FAV_PROPERTY   @"favProperty"
#define UD_LISTED_PROPERTY   @"listedProperty"
#define UD_FAVORITE   @"favoriteProperty"
#define UD_NOTEID   @"noteid"
#define HIDE_NETWORK_ACTIVITY_INDICATOR                 [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
#define SHOW_NETWORK_ACTIVITY_INDICATOR                 [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

#define SCREEN_FRAME_RECT                               [[UIScreen mainScreen] bounds]

#define DATE_FORMAT_USED @"yyyy'-'MM'-'dd' 'HH':'mm':'ss"

#define NAVIGATION_BAR_HEIGHT 44

#endif
