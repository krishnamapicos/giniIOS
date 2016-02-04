//
//  GiniHomePage.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 22/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class GiniHomePage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,PBJVideoPlayerControllerDelegate{
 var selectionList : HTHorizontalSelectionList!
     var arr1 = NSArray()
   // var menuController = RMPScrollingMenuBarController()
     var ccell = FavCollectionCell()
    //v1
    var  playButton = UIImageView()
    var topArr = NSMutableArray()
    var catArr = NSArray()
    var VideoArr = NSArray()
    var urlStr = NSString()
    var urlStr2 = NSString()
    var urlStr3 = NSString()
    var arr = NSArray()
    var arr2 = NSArray()
    var subCatName = NSMutableArray()
    var videoPlayerController : PBJVideoPlayerController?
    var japanName = NSArray()
    var imgStr = NSString()
    var bannerVideo = NSArray()
   // var productIdArr = NSMutableArray()
    var index = Int()
    var arr3 =  NSArray()
    var dic = NSDictionary()
    var im = NSMutableArray()
    var p1 = NSMutableArray()
    var name = NSMutableArray()
    var mark = NSMutableArray()
    var btng = UIButton()
    var productId = NSString()
    var productIdArr = NSArray()
    var favConditionArr = NSArray()
    var shopName = NSArray()
    var marginArr = NSArray()
   /* var videoPlayerController : PBJVideoPlayerController?
    var japanName = NSArray()
    var imgStr = NSString()
    var bannerVideo = NSArray()
    var productIdArr = NSMutableArray()
    var index = Int()*/
    
    
    var app = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var btn = UIButton()
    // var tp = TPKeyboardAvoidingScrollView()
    var newViewController = PopUpViewViewController()
    
    var cartCount = Int()
    
    @IBOutlet weak var cVW: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr1 = ["WHAT'S NEW","FASHION","INTERIORS","LINGERIE","COSMETICS","WATCHES"]
        
        cVW.delegate = self
        cVW.dataSource = self
        
        cVW.registerNib(UINib(nibName:"FavCollectionCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
       
        // Do any additional setup after loading the view.
        
        productListAPI()
        btng = UIButton()
        // btn.setTitle("Video", forState: UIControlState.Normal)
        let image = UIImage(named:"g") as UIImage?
        btng.setBackgroundImage(image, forState: UIControlState.Normal)
       
        
          btng.frame.size = CGSizeMake(50, 50)
        
         let horizontalCenter: CGFloat = UIScreen.mainScreen().bounds.size.width / 2.0
        
     btng.center = CGPoint(x: horizontalCenter, y: UIScreen.mainScreen().bounds.size.height / 1.4)
        print("btng.center\(btng.center)")
        
        
        btng.addTarget(self, action:"gBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        // btn.addTarget(self, action:"navigation:", forControlEvents: UIControlEvents.TouchUpInside)
        // button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(btng)
        

    }
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "gini"
        // let attributes = [NSFontAttributeName : UIFont(name:"Georgiaz-Italic", size: 26)!, NSForegroundColorAttributeName : UIColor.blackColor()]
        //  self.navigationController!.navigationBar.titleTextAttributes = attributes
        let attributes = [NSFontAttributeName : UIFont(name:"Georgia-Italic", size: 26)!, NSForegroundColorAttributeName : UIColor.blackColor()]
        self.navigationController!.navigationBar.titleTextAttributes = attributes
        
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.topItem!.title = "gini"
        // videoApiCall()
        // BannerVideoApiCall()
        /*  var n = VideoArr.count
        n = n * 380
        
        basevwHgt.constant = 200 + CGFloat(n) + 450
        tablHgt.constant =  CGFloat(n)*/
        
        /* if bannerVideo.count == 0 {
        [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
        // vw.bringSubviewToFront(img)
        
        }else{
        videoPlay(vw1)
        videoPlay(vw2)
        
        }*/
        
        
        
        
    }

    func productListAPI(){
        if !(CommonFunctions.reachabiltyCheck()){
            [CommonFunctions .alertTitle("", withMessage: "Internet connection failure")]
            
        }else{
            if ((NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue) != nil) {
                
                let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Products/product_by_genre_id?genre_id=1&customer_id=%d",(NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue)!)
                let url:NSURL = NSURL(string:st as String)!
                let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
                request.HTTPMethod = "GET"
                
                //----------Sending request and get response-------//
                var response: NSURLResponse?
                var data1 : NSData = NSData()
                var error: NSError?
                
                
                
                
                do
                {
                    data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
                }
                catch ( _)
                {
                    [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
                    
                }
                
                
                let res = response as! NSHTTPURLResponse!;
                //  NSLog("Response code: %ld", res.statusCode);
                if res.statusCode == 200
                {
                    do
                    {
                        dic = try NSJSONSerialization.JSONObjectWithData(data1, options:.MutableContainers) as! NSDictionary
                        print(dic)
                        
                        
                        
                        arr3 = dic.valueForKey("result")?.valueForKey("image") as! NSArray
                        catArr = (dic.valueForKey("result")?.valueForKey("is_markdown"))! as! NSArray
                        VideoArr = (dic.valueForKey("result")?.valueForKey("price"))! as! NSArray
                        productIdArr = (dic.valueForKey("result")?.valueForKey("product_id"))! as! NSArray
                        favConditionArr = (dic.valueForKey("result")?.valueForKey("is_fav"))! as! NSArray
                        marginArr = (dic.valueForKey("result")?.valueForKey("margin"))! as! NSArray
                        
                        shopName = (dic.valueForKey("result")?.valueForKey("shop_name"))! as! NSArray
                        
                    }
                        
                        
                    catch ( _)
                        
                    {
                        Crittercism.logError(error)
                        print("Crittercism.logError(error)\(  Crittercism.logError(error))")
                        [CommonFunctions .alertTitle("", withMessage: "Check your internet connection")]
                        
                    }
                    
                }
                else
                {
                    print("server error")
                    [CommonFunctions .alertTitle("", withMessage:"server error")]
                    
                    Crittercism.logError(error)
                    
                }

                
                
            }else {
                let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Products/product_by_genre_id?genre_id=1")
                let url:NSURL = NSURL(string:st as String)!
                let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
                request.HTTPMethod = "GET"
                
                //----------Sending request and get response-------//
                var response: NSURLResponse?
                var data1 : NSData = NSData()
                let error: NSError?
                
                
                
                
                do
                {
                    data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
                }
                catch ( _)
                {
                    [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
                    
                }
                
                
                let res = response as! NSHTTPURLResponse!;
                //  NSLog("Response code: %ld", res.statusCode);
                if res.statusCode == 200
                {
                    do
                    {
                        dic = try NSJSONSerialization.JSONObjectWithData(data1, options:.MutableContainers) as! NSDictionary
                        print(dic)
                        
                        
                        
                        arr3 = dic.valueForKey("result")?.valueForKey("image") as! NSArray
                        catArr = (dic.valueForKey("result")?.valueForKey("is_markdown"))! as! NSArray
                        VideoArr = (dic.valueForKey("result")?.valueForKey("price"))! as! NSArray
                        productIdArr = (dic.valueForKey("result")?.valueForKey("product_id"))! as! NSArray
                        favConditionArr = (dic.valueForKey("result")?.valueForKey("is_fav"))! as! NSArray
                        marginArr = (dic.valueForKey("result")?.valueForKey("margin"))! as! NSArray
                        
                        shopName = (dic.valueForKey("result")?.valueForKey("shop_name"))! as! NSArray
                        
                    }
                        
                        
                    catch ( _)
                        
                    {
                      
                        [CommonFunctions .alertTitle("", withMessage: "Check your internet connection")]
                        
                    }
                    
                }
                else
                {
                    print("server error")
                    [CommonFunctions .alertTitle("", withMessage:"server error")]
                    
                    
                }

            }
          
        
   //
            

}
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arr3.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        
        ccell  = cVW.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! FavCollectionCell
        ccell.img.sd_setImageWithURL(NSURL(string:arr3.objectAtIndex(indexPath.row) as! String), placeholderImage: UIImage(named:"loading.png"))
       
        
        if (catArr.objectAtIndex(indexPath.row).intValue)!   == 0 {
            
            ccell.prize2.text  =  "¥" + (VideoArr.objectAtIndex(indexPath.row) as! String)  as NSString as String
            ccell.prize1.hidden = true
            
        }else if (catArr.objectAtIndex(indexPath.row).intValue)!   == 1 {
            
             ccell.prize2.text  =  "¥" + (VideoArr.objectAtIndex(indexPath.row) as! String)  as NSString as String
            let s = (VideoArr.objectAtIndex(indexPath.row) as! Int) * (marginArr.objectAtIndex(indexPath.row).integerValue) / 100
            ccell.prize1.text = "¥" + String(s)
            
        }
       // productId = productIdArr.objectAtIndex(indexPath.row) as! Int
              if   favConditionArr.objectAtIndex(indexPath.row) as! NSObject == 0 {
            
            ccell.favBtn.setImage(UIImage(named:"Action"), forState: .Normal)
            
            
            
        }else if favConditionArr.objectAtIndex(indexPath.row) as! NSObject == 1{
            
            ccell.favBtn.setImage(UIImage(named:"FavColrChange"), forState: .Normal)
            
            
            
        }
        ccell.shopButton.setTitle(shopName.objectAtIndex(indexPath.row) as? String, forState: .Normal)
        ccell.favBtn.addTarget(self, action:"fav:", forControlEvents: UIControlEvents.TouchUpInside)
        ccell.shopButton.addTarget(self, action:"goToShopPage:", forControlEvents: UIControlEvents.TouchUpInside)
        

        
    
        
       // cell2.nameLb.text = name.objectAtIndex(indexPath.row) as! String
        
        
     
 
        return ccell
    }
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: 150, height: 300)
    }
    
    func goToShopPage(sender: UIButton) {
        
        let buttonPosition = sender.convertPoint(CGPointZero, toView: cVW) as CGPoint
        let indexPath = cVW.indexPathForItemAtPoint(buttonPosition)! as NSIndexPath
       
        print("indexPath\(indexPath.item)")
          productId = productIdArr.objectAtIndex(indexPath.item) as! NSString
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: ShopPage = storyboard.instantiateViewControllerWithIdentifier("ShopPage") as! ShopPage
        
        navigationController?.pushViewController(menuViewController, animated: true)
        
      //  favCall(productId as String)
        
      NSLog("flatButtonPressed")
    }
    func fav(sender: UIButton) {
        
        let buttonPosition = sender.convertPoint(CGPointZero, toView: cVW) as CGPoint
        let indexPath = cVW.indexPathForItemAtPoint(buttonPosition)! as NSIndexPath
        
        print("indexPath\(indexPath.item)")
        productId = productIdArr.objectAtIndex(indexPath.item) as! NSString
        
          favCall(productId as String)
        
        NSLog("flatButtonPressed")
    }

    
    func favCall(id : String){
        
        if !(CommonFunctions.reachabiltyCheck()){
            [CommonFunctions .alertTitle("", withMessage: "Internet connection failure")]
            
        }else{
            
            if ((NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue) != nil) {
                
                
                let strParams =  "&customer_id=" + ((NSUserDefaults.standardUserDefaults().valueForKey("userId"))! as! String) +  "&product_id=" + (id as String)
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
                     [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
                        
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
                            if dic.valueForKey("is_active")?.integerValue == 0 {
                                //  ccell.favBtn.enabled = true
                                //[CommonFunctions .alertTitle("", withMessage: "productAdded")]
                                ccell.favBtn.setImage(UIImage(named:"FavColrChange"), forState: .Normal)
                                //  ccell.favBtn.setBackgroundImage(UIImage(named:"FavColrChange"), forState: .Normal)
                                //  ccell.favBtn.enabled = false
                                //[CommonFunctions .alertTitle("FavItem", withMessage: "productAdded")]
                                
                                
                            }
                            if dic.valueForKey("is_active")?.integerValue == 1 {
                                
                                ccell.favBtn.setImage(UIImage(named:"Action"), forState: .Normal)
                                //ccell.favBtn.enabled = false
                                ccell.favBtn.enabled = true
                                
                                // [CommonFunctions .alertTitle("FavItem", withMessage: "productAdded")]
                                
                                
                                
                            }
                            
                           /* if dic.valueForKey("status")?.integerValue == 0 {
                              //  ccell.favBtn.enabled = true
                               // [CommonFunctions .alertTitle("", withMessage: "productnotAdded")]
                                
                            }
                            if dic.valueForKey("status")?.integerValue == 1 {
                                ccell.favBtn.setImage(UIImage(named:"FavColrChange"), forState: .Normal)
                              //  ccell.favBtn.setBackgroundImage(UIImage(named:"FavColrChange"), forState: .Normal)
                              //  ccell.favBtn.enabled = false
                                
                              //  [CommonFunctions .alertTitle("FavItem", withMessage: "productAdded")]
                                
                                
                                
                            }
                            if dic.valueForKey("is_active")?.integerValue == 0 {
                              //  ccell.favBtn.enabled = true
                                //[CommonFunctions .alertTitle("", withMessage: "productAdded")]
                                ccell.favBtn.setImage(UIImage(named:"FavColrChange"), forState: .Normal)
                              //  ccell.favBtn.setBackgroundImage(UIImage(named:"FavColrChange"), forState: .Normal)
                              //  ccell.favBtn.enabled = false
                                //[CommonFunctions .alertTitle("FavItem", withMessage: "productAdded")]

                                
                            }
                            if dic.valueForKey("is_active")?.integerValue == 1 {
                                
                                ccell.favBtn.setImage(UIImage(named:"Action"), forState: .Normal)
                                //ccell.favBtn.enabled = false
                                ccell.favBtn.enabled = true
                               
                               // [CommonFunctions .alertTitle("FavItem", withMessage: "productAdded")]
                                
                                
                                
                            }*/

                            
                            
                        }
                        catch ( _)
                        {
                            [CommonFunctions .alertTitle("", withMessage: "Check your internet connection")]

                        }
                    }
                    else
                    {
                        
                      [CommonFunctions .alertTitle("", withMessage: "server error..")]
                    }
                    
                    
                    
                }
                
                
                
                
            }else {
                
                print("goto LoginPage")
                let storyboard : UIStoryboard = UIStoryboard(
                    name: "Main",
                    bundle: nil)
                let menuViewController: SignUpPage = storyboard.instantiateViewControllerWithIdentifier("SignUpPage") as! SignUpPage
                
                // self.presentViewController(menuViewController, animated:true, completion:nil)
                navigationController?.pushViewController(menuViewController, animated: true)

                
            }
   
            
        
            
        }
        
        
       
    }
    
    func gBtn (sender : UIButton){
        
        // let buttonPosition = sender.convertPoint(CGPointZero, toView: imageTb) as CGPoint
        // let indexPath = imageTb.indexPathForRowAtPoint(buttonPosition)! as NSIndexPath
        // print("indexPath\(indexPath.row)")
        
        
        newViewController = PopUpViewViewController(nibName: "PopUpViewViewController", bundle: nil)
        
        newViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.view.addSubview( newViewController.view)
        sender.hidden = true
        newViewController.gbtn.addTarget(self, action:"gBtnNew:", forControlEvents: UIControlEvents.TouchUpInside)
        newViewController.favBtn.addTarget(self, action:"favBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        newViewController.cartBtn.addTarget(self, action:"cartBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        newViewController.accBtn.addTarget(self, action:"accBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        cartCountApi()
        // newViewController.gBtnCall(newViewController.gbtn)
        // let model =  RNBlurModalView(view:newViewController.view)
        // model .show()
        
        
        
    }
    func gBtnNew (sender : UIButton){
        
        
        newViewController.view.hidden = true
        btng.hidden = false
        
    }
    func favBtn (sender : UIButton){
        
       /* let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: FavoratesPage = storyboard.instantiateViewControllerWithIdentifier("Fav") as! FavoratesPage
        
        navigationController?.pushViewController(menuViewController, animated: true)*/
         FavDetailApi()
        
    }
    func cartBtn (sender : UIButton){
        
        cartDetailApi()
    }
    func accBtn (sender : UIButton){
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: MyPageVC = storyboard.instantiateViewControllerWithIdentifier("MyPageVC") as! MyPageVC
        
        navigationController?.pushViewController(menuViewController, animated: true)
        
    }
    func cartDetailApi(){
        if !(CommonFunctions.reachabiltyCheck()){
            [CommonFunctions .alertTitle("", withMessage: "Internet connection failure")]
            
        }else{
            
            
            if ((NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue) != nil) {
                
                
                let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/cart_details?customer_id=%d",(NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue)!)
                let url:NSURL = NSURL(string:st as String)!
                
                let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
                request.HTTPMethod = "GET"
                do {
                    // let jsonData = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
                    //  request.HTTPBody = data
                    //----------Sending request and get response-------//
                    var response: NSURLResponse?
                    var data1 : NSData = NSData()
                    do
                    {
                        data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
                    }
                    catch ( _)
                    {
                        
                        [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
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
                            let storyboard : UIStoryboard = UIStoryboard(
                                name: "Main",
                                bundle: nil)
                            
                            if dic.valueForKey("status")?.intValue == 1 {
                                let menuViewController: CartAfterPage = storyboard.instantiateViewControllerWithIdentifier("CartAfer") as! CartAfterPage
                                menuViewController.cartDic = dic
                                
                                navigationController?.pushViewController(menuViewController, animated: true)
                                
                                
                            }else{
                                
                                let menuViewController: CartBeforePage = storyboard.instantiateViewControllerWithIdentifier("CartBeforePage") as! CartBeforePage
                                
                                navigationController?.pushViewController(menuViewController, animated: true)
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                        }
                        catch ( _)
                        {
                            [CommonFunctions .alertTitle("", withMessage: "Check your internet connection")]
                            
                        }
                    }
                    else
                    {
                        
                        [CommonFunctions .alertTitle("", withMessage: "server error..")]
                    }
                    
                    
                    
                }
                
                
                
            }else {
                
                
                let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/cart_details?device_id=%d",app.deviceID)
                let url:NSURL = NSURL(string:st as String)!
                
                
                let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
                request.HTTPMethod = "GET"
                do {
                    
                    var response: NSURLResponse?
                    var data1 : NSData = NSData()
                    do
                    {
                        data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
                    }
                    catch ( _)
                    {
                        [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
                        
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
                            let storyboard : UIStoryboard = UIStoryboard(
                                name: "Main",
                                bundle: nil)
                            
                            if dic.valueForKey("status")?.intValue == 1 {
                                let menuViewController: CartAfterPage = storyboard.instantiateViewControllerWithIdentifier("CartAfer") as! CartAfterPage
                                
                                navigationController?.pushViewController(menuViewController, animated: true)
                                
                                
                            }else{
                                
                                let menuViewController: CartBeforePage = storyboard.instantiateViewControllerWithIdentifier("CartBeforePage") as! CartBeforePage
                                
                                navigationController?.pushViewController(menuViewController, animated: true)
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                        }
                        catch ( _)
                        {
                            [CommonFunctions .alertTitle("", withMessage: "Check your internet connection")]
                            
                        }
                    }
                    else
                    {
                        
                        [CommonFunctions .alertTitle("", withMessage: "server error..")]
                    }
                    
                    
                }
                
                
            }
            

            
            
        }
        
        
        
    }
    
    func cartCountApi(){
        
        if !(CommonFunctions.reachabiltyCheck()){
            [CommonFunctions .alertTitle("", withMessage: "Internet connection failure")]
            
        }else{
            
            if ((NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue) != nil) {
                
                
               
                let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/cart_count?customer_id=%d",(NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue)!)
                let url:NSURL = NSURL(string:st as String)!
                
                let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
                request.HTTPMethod = "GET"
                do {
                    // let jsonData = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
                    //  request.HTTPBody = data
                    //----------Sending request and get response-------//
                    var response: NSURLResponse?
                    var data1 : NSData = NSData()
                    do
                    {
                        data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
                    }
                    catch ( _)
                    {
                        
                       [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
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
                            //var st = Int()
                            cartCount = dic.valueForKey("cart_count") as! Int
                            //  btn1.setTitle("NEW", forState: UIControlState.Normal)
                            newViewController.cartCount!.setTitle(String(cartCount), forState: .Normal)
                            
                            
                            
                        }
                        catch ( _)
                        {
                            [CommonFunctions .alertTitle("", withMessage: "Check your internet connection")]
                            
                        }
                    }
                    else
                    {
                        
                        [CommonFunctions .alertTitle("", withMessage: "server error..")]
                    }

                    
                    
                    
                }
               
                
            }else {
                
                //  let strParams =  "&device_id=" + app.deviceID +  "&product_id=" + (imgst as String)
                // let data = strParams.dataUsingEncoding(NSUTF8StringEncoding)! as NSData
                
                
                // let url:NSURL = NSURL(string:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/add_to_cart?")!
                let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/cart_count?device_id=%d",app.deviceID)
                let url:NSURL = NSURL(string:st as String)!
                
                
                let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
                request.HTTPMethod = "GET"
                do {
                    // let jsonData = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
                    // request.HTTPBody = data
                    //----------Sending request and get response-------//
                    var response: NSURLResponse?
                    var data1 : NSData = NSData()
                    do
                    {
                        data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
                    }
                    catch ( _)
                    {
                        
                        [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
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
                            cartCount = dic.valueForKey("cart_count") as! Int
                            //  btn1.setTitle("NEW", forState: UIControlState.Normal)
                            newViewController.cartCount!.setTitle(String(cartCount), forState: .Normal)
                            
                            
                            
                        }
                        catch ( _)
                        {
                            [CommonFunctions .alertTitle("", withMessage: "Check your internet connection")]
                            
                        }
                    }
                    else
                    {
                        
                        [CommonFunctions .alertTitle("", withMessage: "server error..")]
                    }

                    
                    
                    
                }
                
                
            }

            
            
        }
        
        
        
        
    }
    
//fav
    func FavDetailApi(){
        if !(CommonFunctions.reachabiltyCheck()){
            [CommonFunctions .alertTitle("", withMessage: "Internet connection failure")]
            
        }else{
            
            
            if ((NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue) != nil) {
                // http://103.1.172.70/GINI/gini/index.php/REST/Favourites/favourites?customer_id=6
                
                let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Favourites/favourites?customer_id=%d",(NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue)!)
                let url:NSURL = NSURL(string:st as String)!
                
                let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
                request.HTTPMethod = "GET"
                do {
                    // let jsonData = try NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
                    //  request.HTTPBody = data
                    //----------Sending request and get response-------//
                    var response: NSURLResponse?
                    var data1 : NSData = NSData()
                    do
                    {
                        data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
                    }
                    catch ( _)
                    {
                        
                        [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
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
                            /* let storyboard : UIStoryboard = UIStoryboard(
                            name: "Main",
                            bundle: nil)*/
                            
                            if dic.valueForKey("status")?.intValue == 1 {
                                let storyboard : UIStoryboard = UIStoryboard(
                                    name: "Main",
                                    bundle: nil)
                                let menuViewController: FavoratesPage = storyboard.instantiateViewControllerWithIdentifier("Fav") as! FavoratesPage
                                menuViewController.favDic = dic
                                navigationController?.pushViewController(menuViewController, animated: true)
                                
                            }else{
                                
                                let storyboard : UIStoryboard = UIStoryboard(
                                    name: "Main",
                                    bundle: nil)
                                let menuViewController: FavoratesPage = storyboard.instantiateViewControllerWithIdentifier("Fav") as! FavoratesPage
                                menuViewController.favDic = dic
                                navigationController?.pushViewController(menuViewController, animated: true)
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                        }
                        catch ( _)
                        {
                            [CommonFunctions .alertTitle("", withMessage: "Check your internet connection")]
                            
                        }
                    }
                    else
                    {
                        
                        [CommonFunctions .alertTitle("", withMessage: "server error..")]
                    }
                    

                    
                    
                    
                }
                
                
                
                
            }else {
                print("goto LoginPage")
                let storyboard : UIStoryboard = UIStoryboard(
                    name: "Main",
                    bundle: nil)
                let menuViewController: SignUpPage = storyboard.instantiateViewControllerWithIdentifier("SignUpPage") as! SignUpPage
                
                self.presentViewController(menuViewController, animated:true, completion:nil)
                
                
                /*let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Favourites/favourites?device_id=%d",app.deviceID)
                let url:NSURL = NSURL(string:st as String)!
                
                
                let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
                request.HTTPMethod = "GET"
                do {
                    
                    var response: NSURLResponse?
                    var data1 : NSData = NSData()
                    do
                    {
                        data1 = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
                    }
                    catch ( _)
                    {
                        
                        [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
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
                            /* let storyboard : UIStoryboard = UIStoryboard(
                            name: "Main",
                            bundle: nil)*/
                            
                            if dic.valueForKey("status")?.intValue == 1 {
                                let storyboard : UIStoryboard = UIStoryboard(
                                    name: "Main",
                                    bundle: nil)
                                let menuViewController: FavoratesPage = storyboard.instantiateViewControllerWithIdentifier("Fav") as! FavoratesPage
                                
                                menuViewController.favDic = dic
                                
                                navigationController?.pushViewController(menuViewController, animated: true)
                                
                                
                            }else{
                                
                                let storyboard : UIStoryboard = UIStoryboard(
                                    name: "Main",
                                    bundle: nil)
                                let menuViewController: FavoratesPage = storyboard.instantiateViewControllerWithIdentifier("Fav") as! FavoratesPage
                                menuViewController.favDic = dic
                                navigationController?.pushViewController(menuViewController, animated: true)
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                        }
                        catch ( _)
                        {
                            [CommonFunctions .alertTitle("", withMessage: "Check your internet connection")]
                            
                        }
                    }
                    else
                    {
                        
                        [CommonFunctions .alertTitle("", withMessage: "server error..")]
                    }
                    

                    
                    
                }*/
                

                
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
