//
//  CommonFunctions.m
//  BaitiApp
//
//  Created by Shweta Rao on 27/03/15.
//  Copyright (c) 2015 Shweta Rao. All rights reserved.
//

#import "CommonFunctions.h"

@implementation CommonFunctions
+ (void)customizeNavigationController:(UINavigationController *)navController withImage:(NSString*)image andTintColor:(UIColor *)color
{
    UINavigationBar *navBar = [navController navigationBar];
    [navBar setTintColor:[UIColor clearColor]];
    [navBar setTintColor:color];
    [navBar setBackgroundImage:[UIImage new]
                 forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage = [UIImage new];
    navBar.translucent = YES;
    if ([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [navBar setBackgroundImage:[UIImage imageNamed:image] forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        //        UIImageView *imageView = (UIImageView *)[navBar viewWithTag:kSCNavBarImageTag];
        //        if (imageView == nil)
        //        {
        //            imageView = [[UIImageView alloc] initWithImage:
        //                         image];
        //            [imageView setTag:kSCNavBarImageTag];
        //            [navBar insertSubview:imageView atIndex:0];
        //
        //        }
    }
}

#pragma mark ReachabiltyCheck methods
+ (BOOL)isValueNotEmpty:(NSString*)aString{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    aString = [aString stringByTrimmingCharactersInSet:whitespace];
    
    if (aString == nil || [aString length] == 0){
        
        return NO;
    }
    return YES;
}

+(NSString *)trimSpaceInString:(NSString *)mainstr
{
    NSCharacterSet *whitespace=[NSCharacterSet whitespaceAndNewlineCharacterSet];
    mainstr=[mainstr stringByTrimmingCharactersInSet:whitespace];
    return mainstr;
}
+(BOOL) reachabiltyCheck
{
    
    BOOL status =YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    Reachability * reach = [Reachability reachabilityForInternetConnection];
    
    // //NSLog(@"reachabiltyCheck status  : %d",[reach currentReachabilityStatus]);
    
    if([reach currentReachabilityStatus]==0)
    {
        status = NO;
        //NSLog(@"network not connected");
    }
    
    reach.reachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            // blockLabel.text = @"Block Says Reachable";
        });
    };
    
    reach.unreachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            //  blockLabel.text = @"Block Says Unreachable";
        });
    };
    
    [reach startNotifier];
    return status;
}
+(BOOL)reachabilityChanged:(NSNotification*)note
{
    BOOL status =YES;
    //NSLog(@"reachabilityChanged");
    
    Reachability * reach = [note object];
    
    if([reach isReachable])
    {
        //notificationLabel.text = @"Notification Says Reachable"
        status = YES;
        //NSLog(@"NetWork is Available");
    }
    else
    {
        status = NO;
        /*
         CustomAlert *alert=[[CustomAlert alloc]initWithTitle:@"There was a small problem" message:@"The network doesn't seem to be responding, please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
         [alert show];
         */
    }
    return status;
}

+ (void)removeActivityIndicator:(UIView*)view
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
   // [MBProgressHUD hideHUDForView:APPDELEGATE.window animated:YES];
}

+ (void)showActivityIndicatorWithText:(NSString *)text setView:(UIView *)view {
    [self removeActivityIndicator:view];
    
  //  MBProgressHUD *hud   = [MBProgressHUD showHUDAddedTo:APPDELEGATE.window animated:YES];
    //hud.labelText        = text;
  //  hud.detailsLabelText = NSLocalizedString(@"Please Wait...", @"");
}
/*!
 @function	removeActivityIndicator
 @abstract	removes the MBProgressHUD (if any) from window.
 */

+(BOOL)IsValidEmail:(NSString *)checkString
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

+ (void)alertTitle:(NSString*)aTitle withMessage:(NSString*)aMsg withDelegate:(id)delegate{
    
    if (aTitle.length==0)
    {
        aTitle=@"";
    }
    
    UIAlertView *alrtVw=[[UIAlertView alloc] initWithTitle:aTitle
                                message:aMsg
                               delegate:delegate
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil];
    [alrtVw show];

    
}

+(void)setNavigationBar:(UINavigationController*)navController
{
    
    UINavigationBar *navBar=navController.navigationBar;
    navController.navigationBar.barTintColor=[UIColor orangeColor];
    navBar.tintColor=[UIColor whiteColor];
    
//    UIImage *img=[UIImage imageNamed:@"top_bar_bg"];
    
   // [navBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    [navController setNavigationBarHidden:FALSE];
    [navController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"OXYGEN-REGULAR" size:18],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
    [navController.navigationBar setTranslucent:NO];
    
    
//    UIView *statusView=[[UIView alloc]initWithFrame:CGRectMake(0, -[UIApplication sharedApplication].statusBarFrame.size.height,[UIApplication sharedApplication].statusBarFrame.size.width, [UIApplication sharedApplication].statusBarFrame.size.height)];
//    [statusView setBackgroundColor:[UIColor colorWithRed:185.0f/255.0f green:0/255.0f blue:36.0f/255.0f alpha:1]];
//    [navBar addSubview:statusView];
    
}

+ (void)alertTitle:(NSString*)aTitle withMessage:(NSString*)aMsg withDelegate:(id)delegate withTag:(int)tag{
    UIAlertView *alrtVw=[[UIAlertView alloc] initWithTitle:@"Gini"
                                                   message:aMsg
                                                  delegate:delegate
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil, nil];
    [alrtVw show];
    alrtVw.tag=tag;
    
}

+ (void)alertTitleArabic:(NSString*)aTitle withMessage:(NSString*)aMsg withDelegate:(id)delegate withTag:(int)tag{
    UIAlertView *alrtVw=[[UIAlertView alloc] initWithTitle:@"بيتي التطبيق"
                                                   message:aMsg
                                                  delegate:delegate
                                         cancelButtonTitle:@"حسنا"
                                         otherButtonTitles:nil, nil];
    [alrtVw show];
    alrtVw.tag=tag;
    
}


+ (void)alertTitle:(NSString*)aTitle withMessage:(NSString*)aMsg BtnTitle:(NSString*)btnName withDelegate:(id)delegate{
    [[[UIAlertView alloc] initWithTitle:@"BaitiApp"
                                message:aMsg
                               delegate:delegate
                      cancelButtonTitle:btnName
                      otherButtonTitles:nil, nil] show];
}
+ (void)alertTitle:(NSString*)aTitle withMessage:(NSString*)aMsg{
    [self alertTitle:@"Gini" withMessage:aMsg withDelegate:self];
}


+ (void)alertArabicTitle:(NSString*)aTitle withMessage:(NSString*)aMsg{
    [self alertTitle:@"بيتي التطبيق" withMessage:aMsg withDelegate:self];
}

+(NSDate *)convertDateFromGMTFormat:(NSString *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate* dateA = [dateFormatter dateFromString:date];
    
    
    return dateA;
}

/*+ (void) showHUDWithLabel:(NSString *)messageLabel ForNavigationController:(UINavigationController*) navController
{

    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[AppDelegate getSharedInstance].window animated:YES];
    
    HUD.color =[UIColor whiteColor];//colorWithPatternImage:ApplicationThemePatternImage];//[self image:ApplicationThemePatternImage withColor:[UIColor whiteColor]]];

    HUD.mode = MBProgressHUDModeCustomView;
    HUD.removeFromSuperViewOnHide = YES;
    HUD.labelColor = [UIColor blackColor];
    HUD.layer.borderWidth = 0.0;
    HUD.layer.borderColor = [UIColor blackColor].CGColor;
    HUD.alpha = 0.7;
    
    NSMutableArray *array = [[NSMutableArray alloc] init
                             ];
    
    //    NSString *imageName ="
    
    for(int i=1 ;i<= 30; i++)
    {
        NSString *string;
        if(i>=10){
            string = [NSString stringWithFormat:@"100%d.png",i];
        }
        else {
            string = [NSString stringWithFormat:@"1000%d.png",i];
        }
        [array addObject:[UIImage imageNamed:string]];
    }
    
    UIImageView *customView = [[UIImageView alloc] initWithImage:[UIImage animatedImageWithImages:array duration:1.0]];
    [customView startAnimating];
    customView.frame = CGRectMake(0, 0, 40, 40);
    HUD.customView = customView;
    
    if(messageLabel != nil) {
        HUD.labelText = messageLabel;
        HUD.labelFont = [UIFont fontWithName:FONT_BOLD size:12.0f];
    }
    
    [HUD bringSubviewToFront:navController.view];
}*/

@end
