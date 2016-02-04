//
//  AppDelegate.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 21/12/15.
//  Copyright © 2015 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,CLLocationManagerDelegate{

    var window: UIWindow?
    var HUD = MBProgressHUD()
    var dict = NSDictionary()
     var imgArr = NSMutableArray()
    var arr = NSArray()
    var menuController = RMPScrollingMenuBarController()
     var nav = UINavigationController()
    var tabArr = ["WHAT'S NEW","FASHION","INTERIORS","LINGERIE","COSMETICS","WATCHES"]
    var item : RMPScrollingMenuBarItem!
    var yogo = UIFont()
    var yogoBold = UIFont()
     var yogoMedium = UIFont()
    var deviceID = UIDevice.currentDevice().identifierForVendor!.UUIDString
    var version =  UIDevice.currentDevice().systemVersion
    var currentLocation : CLLocation!
    var locationManager =  CLLocationManager()
    




    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       // Crittercism.enableWithAppID("5694f232cb99e10e00c7ecae")
        // Override point for customization after application launch.
       // self.setup()
        
       //  fontDownload("YuGo")
      //  fontDownload("YuGo-Bold")
      //  fontDownload("YuGo-Medium")
       /* if #available(iOS 8.0, *) {
            locationManager.requestWhenInUseAuthorization()
        } else {
            // Fallback on earlier versions
        };
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            
            locationManager.startUpdatingLocation()
            
        }
        else{
            print("Location service disabled");
        }*/
        //[self asynchronouslySetFontName:@"YuGo-Medium" bootFlg:NO];
        //[self asynchronouslySetFontName:@"YuGo-Bold" bootFlg:YES];
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler:
            {(placemarks, error)->Void in
                
                if (error != nil)
                {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                
                if placemarks!.count > 0
                {
                    let pm = placemarks?.first
                    self.displayLocationInfo(pm)
                }
                else
                {
                    print("Problem with the data received from geocoder")
                }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark?)
    {
        if let containsPlacemark = placemark
        {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            print("dictionary\(containsPlacemark)")
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            print("locality ",locality)
            print("postal code",postalCode)
            print("locality ",administrativeArea)
            print("postal code",country)
            
        }
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Error while updating location " + error.localizedDescription)
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.mapicos.GiniDemo" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("GiniDemo", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    
    // MARK : Loader
    func showLoader(){
        
        HUD = MBProgressHUD(window: window)
        self.window?.addSubview(HUD)
        HUD.tag = 9999998
        HUD.hidden = false
        HUD.labelText = ""
        HUD.show(true)
        
    }
    func stopLoader(){
        
        window?.viewWithTag(9999998)?.removeFromSuperview()
        HUD.removeFromSuperview()
        HUD.hidden = true
    }
    func showLoaderWithText(txt :NSString , txt1:NSString){
        
        HUD = MBProgressHUD(window: window)
        self.window?.addSubview(HUD)
        HUD.tag = 9999998
        HUD.hidden = false
        HUD.labelText = ""
        HUD.detailsLabelText = ""
        HUD.show(true)
        
        
    }
    
    func setup() {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Setup menu bar controller
        let menuController = RMPScrollingMenuBarController()
        menuController.delegate = self
        
        // Customize appearance of menu bar.
        menuController.view.backgroundColor = UIColor.whiteColor()
        menuController.menuBar.indicatorColor = UIColor.blackColor()
       // menuController.menuBar.style = .InfinitePaging
        
        //menuController.menuBar.showsIndicator = false
        //menuController.menuBar.showsSeparatorLine = false
        
        // Set ViewControllers for menu bar controller
        // var tabArr = ["FASHION","WHAT'S NEW","INTERIORS","LINGERIE","COSMETICS","WATCHES"]
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: NSBundle.mainBundle())
        let v1: GiniHomePage = storyboard.instantiateViewControllerWithIdentifier("GiniHomePage") as! GiniHomePage
        let v2: ViewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        let v3: InteriorsPage = storyboard.instantiateViewControllerWithIdentifier("InteriorsPage") as! InteriorsPage
        let v4: LingeriePage = storyboard.instantiateViewControllerWithIdentifier("LingeriePage") as!  LingeriePage
        let v5: CosmeticsPage = storyboard.instantiateViewControllerWithIdentifier("CosmeticsPage") as! CosmeticsPage
        let v6: WatchesPage = storyboard.instantiateViewControllerWithIdentifier("WatchesPage") as! WatchesPage
        var viewControllers = NSArray()
        viewControllers = [v2,v1,v3,v4,v5,v6]
     
       
        menuController.setViewControllers(viewControllers as [AnyObject], animated: false)
        
        let naviController = UINavigationController(rootViewController: menuController)
         menuController.navigationItem.title = "gini"
    menuController.navigationController?.navigationBar.backgroundColor = UIColor.whiteColor()
        
        
        let attributes = [NSFontAttributeName : UIFont(name:"Georgia-Italic", size: 26)!, NSForegroundColorAttributeName : UIColor.blackColor()]
        menuController.navigationController?.navigationBar.titleTextAttributes = attributes
//menuController.menuBar.style = RMPScrollingMenuBarStyle.Normal
        // self.navigationController!.navigationBar.titleTextAttributes = attributes
   
       
        self.window?.rootViewController = naviController
        self.window?.makeKeyAndVisible()
    }
}

@available(iOS 8.0, *)
extension AppDelegate: RMPScrollingMenuBarControllerDelegate {
    func menuBarController(menuBarController: RMPScrollingMenuBarController!, willSelectViewController viewController: UIViewController!) {
        print("will select \(viewController)")
    }
    
    func menuBarController(menuBarController: RMPScrollingMenuBarController!, didSelectViewController viewController: UIViewController!) {
        print("did select \(viewController)")
    }
    
    func menuBarController(menuBarController: RMPScrollingMenuBarController!, didCancelViewController viewController: UIViewController!) {
        print("did cancel \(viewController)")
    }
    
    func menuBarController(menuBarController: RMPScrollingMenuBarController!, menuBarItemAtIndex index: Int) -> RMPScrollingMenuBarItem! {
        item = RMPScrollingMenuBarItem()
        
        
        
         item.title = tabArr[index]
        let button = item.button()
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Disabled)
        button.setTitleColor(UIColor.blackColor(), forState: .Selected)
         // button.titleLabel!.font = yogo
    
       // print("button.titleLabel!.font\(button.titleLabel!.font.valueForKey("name"))")
        
        
        return item
    }


    func fontDownload(name: String) {
        let size: CGFloat = 12
        
        let f : UIFont! = UIFont(name:name, size:size)
        if f != nil {
            //greekFont = f
            print("Font \(name) already installed")
            return
        }
        print("attempting to download font")
        let desc = UIFontDescriptor(name:name, size:size)
        CTFontDescriptorMatchFontDescriptorsWithProgressHandler(
            [desc], nil, {
                (state:CTFontDescriptorMatchingState, prog:CFDictionary!) -> Bool in
                switch state {
                case .DidBegin:
                    print("\(name) matching did begin")
                case .WillBeginDownloading:
                    print("\(name) downloading will begin")
                case .Downloading:
                    let d = prog as NSDictionary
                    let key = kCTFontDescriptorMatchingPercentage
                    let cur : AnyObject? = d[key as NSString]
                    if let cur = cur as? NSNumber {
                        NSLog("progress: %@%%", cur)
                    }
                case .DidFinishDownloading:
                    print("\(name) downloading did finish")
                case .DidFailWithError:
                    print("\(name) downloading failed")
                case .DidFinish:
                    print("\(name) matching did finish")
                    dispatch_async(dispatch_get_main_queue(), {
                        let f : UIFont! = UIFont(name:name, size:size)
                        
                        if f != nil {
                            
                            if name == "YuGo" {
                                
                                self.yogo = f
                                
                            }else if name == "YuGo-Bold"  {
                                
                                self.yogoBold = f
                                
                            }else if name == "YuGo-Medium" {
                                self.yogoMedium = f
                                
                            }
                            
                            print("Downloaded font: \(f)")
                          //  self.customFont = f
                        }
                    })
                default:break
                }
                return true
        })
    }

}

