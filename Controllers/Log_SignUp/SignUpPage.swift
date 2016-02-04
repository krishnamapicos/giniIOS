//
//  SignUpPage.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 26/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class SignUpPage: UIViewController,RMPScrollingMenuBarControllerDelegate {
let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
     var tabArr = ["WHAT'S NEW","FASHION","INTERIORS","LINGERIE","COSMETICS","WATCHES"]
     var item : RMPScrollingMenuBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        
         self.navigationController?.navigationBarHidden = true
            }

    @IBAction func goToLogInPage(sender: AnyObject) {
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: LoginVC = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginVC
         self.navigationController?.pushViewController(menuViewController, animated: true)
       // self.presentViewController(menuViewController, animated:true, completion:nil)
        
       // navigationController?.pushViewController(menuViewController, animated: true)

    }
    @IBAction func goToRegPage(sender: AnyObject) {
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: RegistrationPage = storyboard.instantiateViewControllerWithIdentifier("RegistrationPage") as! RegistrationPage
        
       // self.presentViewController(menuViewController, animated:true, completion:nil)
        navigationController?.pushViewController(menuViewController, animated: true)
       // self.navigationController?.pushViewController(menuViewController, animated: true)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func skipCall(sender: AnyObject) {
         setup()
    }
    func setup() {
        // self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Setup menu bar controller
        let menuController = RMPScrollingMenuBarController()
        menuController.delegate = self
        
        // Customize appearance of menu bar.
        menuController.view.backgroundColor = UIColor.whiteColor()
       // menuController.menuBar.indicatorColor = UIColor.blackColor()
        
        // menuController.menuBar.style = .InfinitePaging
        
        menuController.menuBar.showsIndicator = false
       // menuController.menuBar.showsSeparatorLine = false
        
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
       // menuController.navigationItem.backBarButtonItem?.title = "もどる"
      //  menuController.navigationController?.navigationBar.backgroundColor = UIColor.whiteColor()
        
        
        let attributes = [NSFontAttributeName : UIFont(name:"Georgia-Italic", size: 26)!, NSForegroundColorAttributeName : UIColor.blackColor()]
        menuController.navigationController?.navigationBar.titleTextAttributes = attributes
        
        //menuController.menuBar.style = RMPScrollingMenuBarStyle.Normal
        // self.navigationController!.navigationBar.titleTextAttributes = attributes
        
       // delegate.window!.rootViewController = naviController
         delegate.window!.rootViewController = naviController
        delegate.window!.makeKeyAndVisible()
        
        
        
    }
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
        
        
       // let stringSize:CGSize = (tabArr[index] as NSString).sizeWithAttributes([NSFontAttributeName: UIFont(name: "Georgia", size: 22.0)!])
       // button.frame.size = stringSize
       
        button.setTitleColor(UIColor.grayColor(), forState: .Normal)
        button.setTitleColor(UIColor.grayColor(), forState: .Disabled)
        button.setTitleColor(UIColor.blackColor(), forState: .Selected)
        
       // button.titleLabel?.font = UIFont(name:"Georgia", size: 22.0)
        // button.titleLabel!.font = yogo
        
        // print("button.titleLabel!.font\(button.titleLabel!.font.valueForKey("name"))")
        
        
        return item
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
