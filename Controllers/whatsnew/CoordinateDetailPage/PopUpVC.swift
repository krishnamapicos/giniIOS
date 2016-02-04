//
//  PopUpVC.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 29/12/15.
//  Copyright © 2015 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class PopUpVC: UIViewController,UIAlertViewDelegate,UINavigationControllerDelegate,UINavigationBarDelegate {
     var app = UIApplication.sharedApplication().delegate as! AppDelegate
    @IBOutlet weak var sizeBtn: UIButton!
    
    @IBOutlet weak var colourBtn: UIButton!
    
    @IBOutlet weak var sizelb2: UILabel!
    @IBOutlet weak var sizelb4: UILabel!

    @IBOutlet weak var prize1lb: UILabel!
    @IBOutlet weak var prize2lb: UILabel!
    @IBOutlet weak var productNameLb: UILabel!
    @IBOutlet weak var sizelb7: UILabel!
    @IBOutlet weak var sizelb6: UILabel!
    @IBOutlet weak var sizelb5: UILabel!
    @IBOutlet weak var sizelb3: UILabel!
    @IBOutlet weak var comView: UIView!
    @IBOutlet weak var sizelb1: UILabel!
    @IBOutlet weak var dis2lb: UILabel!
    @IBOutlet weak var dis1lb: UILabel!
    @IBOutlet weak var detailImg: UIImageView!
    var alert = UIAlertView()
    var alert1 = UIAlertView()
    var imgst = NSString()
    var imgArr = NSString()
    var disc = NSArray()
    var sizeDis = NSArray()
    var productName = NSArray()
    var dic = NSDictionary()
    var colourArr = NSArray()
    var sizeArr = NSArray()
    var imageArr = NSArray()
    var favCondition = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
       // self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
       // navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        self.navigationController!.navigationBar.barTintColor = UIColor.blackColor()
       
        print("detailUrlStr\(imgst)")
        ProductDetailApiCall()
       detailImg.sd_setImageWithURL(NSURL(string:imageArr.objectAtIndex(0) as! String), placeholderImage:UIImage(named:"loading.png"))
       // let str = disc.objectAtIndex(0)
       // print("str\(str)")
        //let myStringArr = disc.objectAtIndex(0).componentsSeparatedByString(":") as String
         //print("str\(myStringArr)")
       // let s = myStringArr[0].componentsSeparatedByString(" ")
        
       // print("dis\(disc)")
       // dis1lb.text = s[0]
     // let st =  myStringArr[2] as String
    //let   dis = disc.objectAtIndex(0).(myStringArr[0] + ":", withString:" ") as String
        
       
        dis2lb.numberOfLines = 10
         dis2lb.preferredMaxLayoutWidth =  self.view.frame.size.width - 40
       dis2lb.text =  disc.objectAtIndex(0) as? String
        
        let myStringArr1 = sizeDis.objectAtIndex(0).componentsSeparatedByString(" ") as NSArray
         print("print\(myStringArr1)")
        print("str\(myStringArr1)")
       // sizelb1.text = myStringArr1[0]
        if sizeDis.objectAtIndex(0) as! String == "" {
            
            
        }else{
            sizelb2.text = myStringArr1[1] as? String
            sizelb3.text = myStringArr1[2] as? String
            sizelb4.text = myStringArr1[3] as? String
            sizelb5.text = myStringArr1[4] as? String
            sizelb6.text = (myStringArr1[6] as! String) + (myStringArr1[7] as! String)
            sizelb7.numberOfLines = 5
            sizelb7.preferredMaxLayoutWidth = self.view.frame.size.width  - 40
            sizelb7.text = myStringArr1[9] as? String
            productNameLb.text = productName.objectAtIndex(0) as? String
            

        }
        
        
        if (dic.valueForKey("result")?.valueForKey("is_markdown")?.objectAtIndex(0).intValue)!   == 0 {
            
            prize1lb.text = "¥" + ((dic.valueForKey("result")?.valueForKey("price")?.objectAtIndex(0))! as! String) as NSString as String
            prize2lb.hidden = true
            
        }else if (dic.valueForKey("result")?.valueForKey("is_markdown")?.objectAtIndex(0).intValue)!   == 1 {
            
        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.topItem!.title = " "
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ProductDetailApiCall(){
        
       
      let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Coordinates/products_by_product_id?product_id=%d", imgst.intValue)
        print("st\(st)")
        let url:NSURL = NSURL(string:st as String)!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        
        //----------Sending request and get response-------//
        var response: NSURLResponse?
        var data1 : NSData = NSData()
        do
        {
            data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        }
        catch ( _)
        {
            print("Internet conncetion may slow.please try again")
            
        }
        
        
        let res = response as! NSHTTPURLResponse!;
        NSLog("Response code: %ld", res.statusCode);
        if res.statusCode == 200
        {
            do
            {
                dic = try NSJSONSerialization.JSONObjectWithData(data1, options:.MutableContainers) as! NSDictionary
                print(dic)
                imageArr = (dic.valueForKey("result")?.valueForKey("product_image")) as! NSArray
               // imgArr = (dic.valueForKey("result")?.("image_url"))! as! NSArray
                disc = (dic.valueForKey("result")?.valueForKey("product_desc"))! as! NSArray
                print(disc)
              sizeDis = (dic.valueForKey("result")?.valueForKey("size_desc"))! as! NSArray
             productName = (dic.valueForKey("result")?.valueForKey("product_name"))! as! NSArray
                let favArr = (dic.valueForKey("result")?.valueForKey("is_fav"))! as! NSArray
                favCondition = favArr.objectAtIndex(0).integerValue

              //app.dict = dic
                
               print("imgArr\(imgArr)")
                
                
            }
             
                
            catch ( _)
                
            {
                
                
            }
            
        }
        else
        {
            print("server error")
            
        }
        
        
        
        
    }
    @IBAction func colourAPICall(sender: AnyObject) {
        colorAPI()
        
        alert = UIAlertView(title: "Select Colour", message:"", delegate: self, cancelButtonTitle:"Cancel")
        for device in colourArr {
           
            alert.addButtonWithTitle(device as? String)
            
        }
        alert.show()
        
       
        
        
    }
    func alertView(View: UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        
       
        if View == alert {
            let buttonTitle = alert.buttonTitleAtIndex(buttonIndex)
            switch buttonIndex{
                
            case 0:
                
                NSLog("Check yor internet");
                colourBtn.setTitle("カラー", forState: UIControlState.Normal)
                
                
                break;
            default:
                //  NSLog("");
                // selectKadai.setTitle(buttonTitle, forState: UIControlState.Normal)
                colourBtn.setTitle(buttonTitle, forState: UIControlState.Normal)
                
                
                break;
                
            }
    
        }else if View == alert1 {
            
            
            
            let buttonTitle = alert1.buttonTitleAtIndex(buttonIndex)
            switch buttonIndex{
                
            case 0:
                
                NSLog("Check yor internet");
                sizeBtn.setTitle("サイズ", forState: UIControlState.Normal)
                
                
                break;
            default:
               
                sizeBtn.setTitle(buttonTitle, forState: UIControlState.Normal)
                
                break;
                
                
            }

            
        }
       
        
            
       
    }
    


    @IBAction func sizeAPICall(sender: AnyObject) {
        
        
        sizeAPI()
        alert1 = UIAlertView(title: "Select Colour", message:"", delegate: self, cancelButtonTitle:"Cancel")
        for device in sizeArr {
            
            alert1.addButtonWithTitle(device as? String)
            
        }
        alert1.show()
        

        
    }
    func colorAPI(){
        
    
        let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Masters/get_colors")
        let url:NSURL = NSURL(string:st as String)!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        
        //----------Sending request and get response-------//
        var response: NSURLResponse?
        var data1 : NSData = NSData()
        do
        {
            data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        }
        catch ( _)
        {
            print("Internet conncetion may slow.please try again")
            
        }
        
        
        let res = response as! NSHTTPURLResponse!;
        NSLog("Response code: %ld", res.statusCode);
        if res.statusCode == 200
        {
            do
            {
                dic = try NSJSONSerialization.JSONObjectWithData(data1, options:.MutableContainers) as! NSDictionary
                print(dic)
              colourArr = (dic.valueForKey("result")?.valueForKey("color_name"))! as! NSArray
                
            }
                
                
            catch ( _)
                
            {
                
                
            }
            
        }
        else
        {
            print("server error")
            
        }

        
        
        
    }
    
    func sizeAPI(){
        
        
        let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Masters/sizes")
        let url:NSURL = NSURL(string:st as String)!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        
        //----------Sending request and get response-------//
        var response: NSURLResponse?
        var data1 : NSData = NSData()
        do
        {
            data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        }
        catch ( _)
        {
            print("Internet conncetion may slow.please try again")
            
        }
        
        
        let res = response as! NSHTTPURLResponse!;
        NSLog("Response code: %ld", res.statusCode);
        if res.statusCode == 200
        {
            do
            {
                dic = try NSJSONSerialization.JSONObjectWithData(data1, options:.MutableContainers) as! NSDictionary
              //  print(dic)
                sizeArr = (dic.valueForKey("result")?.valueForKey("size_short"))! as! NSArray
               
                
                
                
                
                
                
            }
                
                
            catch ( _)
                
            {
                
                
            }
            
        }
        else
        {
            print("server error")
            
        }

    }
    @IBAction func goToShopPage(sender: AnyObject) {
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: ShopPage = storyboard.instantiateViewControllerWithIdentifier("ShopPage") as! ShopPage
        
        navigationController?.pushViewController(menuViewController, animated: true)
       // self.presentViewController(menuViewController, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func linkToAllThePages(sender: AnyObject) {
     
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: ProductVC = storyboard.instantiateViewControllerWithIdentifier("ProductVC") as! ProductVC
        menuViewController.productId = imgst.integerValue
        
        navigationController?.pushViewController(menuViewController, animated: true)
        
        
        
    }
    
    @IBAction func AddToCart(sender: AnyObject) {
        
        if ((NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue) != nil) {
            
            
            let strParams =  "&customer_id=" + ((NSUserDefaults.standardUserDefaults().valueForKey("userId"))! as! String) +  "&product_id=" + (imgst as String)
            let data = strParams.dataUsingEncoding(NSUTF8StringEncoding)! as NSData
            
           
            let url:NSURL = NSURL(string:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/add_to_cart?")!
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
                        
                        if dic.valueForKey("status")?.integerValue == 0 {
                           [CommonFunctions .alertTitle("", withMessage: "Already This Product Is In Your Cart")]
                            
                        }
                        if dic.valueForKey("status")?.integerValue == 1 {
                            [CommonFunctions .alertTitle("", withMessage: "Product is Added")]
                            
                            
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
            

            
            
        }else {
          //  let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/add_to_cart?device_id=%d?product_id=%d",app.deviceID,imgst.intValue)
            // let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/add_to_cart?customer_id=%d?product_id=%d",(NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue)!,imgst.intValue)
           // let url:NSURL = NSURL(string:st as String)!
            
            //let url:NSURL = NSURL(string:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/add_to_cart?customer_id=%d?product_id=%d")!
            let strParams =  "&device_id=" + app.deviceID +  "&product_id=" + (imgst as String)
            let data = strParams.dataUsingEncoding(NSUTF8StringEncoding)! as NSData
            
            
            let url:NSURL = NSURL(string:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/add_to_cart?")!
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
                            [CommonFunctions .alertTitle("", withMessage: "Product is Added")]
                            
                            
                        }
                        if dic.valueForKey("status")?.integerValue == 0 {
                            [CommonFunctions .alertTitle("", withMessage: "Already This Product Is In Your Cart")]
                            
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
        

        
        
    }
    
    @IBAction func AddFavorateAPICall(sender: AnyObject) {
        
        
        if ((NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue) != nil) {
            
            
            if favCondition == 0 {
                
                let strParams =  "&customer_id=" + ((NSUserDefaults.standardUserDefaults().valueForKey("userId"))! as! String) +  "&product_id=" + (imgst as String)
                let data = strParams.dataUsingEncoding(NSUTF8StringEncoding)! as NSData
                
                
                let url:NSURL = NSURL(string:"http://103.1.172.70/GINI/gini/index.php/REST/Favourites/add_to_favourite")!
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
  
                
                
                
            }else if favCondition == 1{
                
                
                
                
                
            }
            
            
            
        }
            
            
        

        
        
        
        
        
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
