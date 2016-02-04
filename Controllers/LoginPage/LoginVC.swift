//
//  LoginVC.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 20/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class LoginVC: UIViewController ,RMPScrollingMenuBarControllerDelegate, UITextFieldDelegate{
    @IBOutlet weak var userNameText: UITextField!

    @IBOutlet weak var passwordText: UITextField!
    let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var menuController = RMPScrollingMenuBarController()
    var nav = UINavigationController()
    var tabArr = ["WHAT'S NEW","FASHION","INTERIORS","LINGERIE","COSMETICS","WATCHES"]
    var item : RMPScrollingMenuBarItem!

    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
       
        
        self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationItem.title = "コーデ詳細"
       // self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        let attributes = [NSFontAttributeName : UIFont(name:"Georgia", size: 15)!, NSForegroundColorAttributeName : UIColor.blackColor()]
        self.navigationController!.navigationBar.titleTextAttributes = attributes

         NSUserDefaults.standardUserDefaults().removeObjectForKey("userId")
        userNameText.delegate = self
        passwordText.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logInAPICall(sender: AnyObject) {
        
        if validText(){
            print("valid")
            
           userNameText.layer.borderColor = UIColor.clearColor().CGColor
            passwordText.layer.borderColor = UIColor.clearColor().CGColor
            
            //   mobileNumberTxt.layer.borderColor = UIColor.clearColor().CGColor
            registrationAPICall()
            
            
            
        }

        
    }
    func registrationAPICall(){
        
        let strParams =  "&email_address=" + userNameText.text!  +  "&password=" + passwordText.text!
        let data = strParams.dataUsingEncoding(NSUTF8StringEncoding)! as NSData
        
       // print("params\(params)")
        
        
        let url:NSURL = NSURL(string:"http://103.1.172.70/GINI/gini/index.php/REST/Auth/signin")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        do {
            // let jsonData = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
            request.HTTPBody = data
            //----------Sending request and get response-------//
            var response: NSURLResponse?
            var data1 : NSData = NSData()
            do
            {
                data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            }
            catch ( _)
            {
                
                
            }
            
            //----------Converting response data to array-------//
            let res = response as! NSHTTPURLResponse!;
            NSLog("Response code: %ld", res.statusCode);
            if res.statusCode == 200
            {
                do
                {
                    let dic = try NSJSONSerialization.JSONObjectWithData(data1, options: .MutableContainers) as! NSDictionary
                    print(dic)
                    if dic.valueForKey("status")?.integerValue == 1 {
                        
                        let userDefaults = NSUserDefaults.standardUserDefaults()
                        userDefaults.setValue(dic.valueForKey("result")?.valueForKey("customer_id"), forKey:"userId")
                        userDefaults.synchronize()

                        setup()
                    }
                    
                   
                    
                    
                }
                catch ( _)
                {
                    
                }
            }
            else
            {
                
                
            }
            
            
            
        }
        catch (_){
            
        }
        
        
        
    }
    
    func validText() -> Bool{
        var errormsg = String()
        var  err = false
        
        
        let email = userNameText.text
        
        let password_value = passwordText.text
        
        
        let email_validation = Validate.isValidEmailId(email)
        
        let passwordValidation = Validate.isValidPassword(password_value)
        
        // LIAME:
        
        if email_validation == false
        {
            userNameText.layer.borderWidth = 1
            userNameText.layer.borderColor = UIColor.redColor().CGColor
            errormsg = "please enter valid mail address"
            err = true
            [userNameText.becomeFirstResponder()]
            // [CommonFunctions .alertTitle("", withMessage: "please enter valid mail address")]
        }else if passwordValidation == false
        {
            passwordText.layer.borderWidth = 1
            passwordText.layer.borderColor = UIColor.redColor().CGColor
            errormsg = "Password Textfield should not empty"
            err = true
            [passwordText.becomeFirstResponder()]
            // [CommonFunctions .alertTitle("", withMessage: "Password Textfield should contain 6 letters")]
        }
        
        if err{
            // print("Email address cannot be blank.", terminator: "")
            // [CommonFunctions .alertTitle("", withMessage:errormsg)]
            
            return false
        }
        else{
            
            return true
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    func setup() {
       // self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Setup menu bar controller
        let menuController = RMPScrollingMenuBarController()
        menuController.delegate = self
        
        // Customize appearance of menu bar.
        menuController.view.backgroundColor = UIColor.whiteColor()
      //  menuController.menuBar.indicatorColor = UIColor.blackColor()
        // menuController.menuBar.style = .InfinitePaging
        
        menuController.menuBar.showsIndicator = false
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
        button.setTitleColor(UIColor.grayColor(), forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Disabled)
        button.setTitleColor(UIColor.blackColor(), forState: .Selected)
        // button.titleLabel!.font = yogo
        
        // print("button.titleLabel!.font\(button.titleLabel!.font.valueForKey("name"))")
        
        
        return item
    }

    @IBOutlet weak var goToSignUpPageCall: UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
