//
//  ViewController.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 21/12/15.
//  Copyright © 2015 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

import AVFoundation
extension String {
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "_")
    }
}

@available(iOS 8.0, *)
class ViewController: UIViewController,PBJVideoPlayerControllerDelegate,UITableViewDataSource,UITableViewDelegate, UIAlertViewDelegate,UIPopoverPresentationControllerDelegate,UIScrollViewDelegate,UINavigationControllerDelegate {
   
    @IBOutlet weak var tp: TPKeyboardAvoidingScrollView!
  
  
        
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var vw2: UIView!
    @IBOutlet weak var vw1: UIView!
    
    @IBOutlet weak var imageTb: UITableView!
     var cell2 = ImageCell()
   // var videoPlayerController = PBJVideoPlayerController()
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
    var productIdArr = NSMutableArray()
    var index = Int()
    var arr3 =  NSArray()
    var img = UIImageView()
   
   var app = UIApplication.sharedApplication().delegate as! AppDelegate
    @IBOutlet weak var basevwHgt: NSLayoutConstraint!
    @IBOutlet weak var scrlHgt: NSLayoutConstraint!
    
    @IBOutlet weak var tablHgt: NSLayoutConstraint!
    @IBOutlet weak var btmLayOut: NSLayoutConstraint!
    var btn = UIButton()
   // var tp = TPKeyboardAvoidingScrollView()
     var newViewController = PopUpViewViewController()
    var btng = UIButton()
    var cartCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //http://install.diawi.com/aY1Zq7
        videoApiCall()
        BannerVideoApiCall()
        imageTb.delegate = self
        imageTb.dataSource = self
       
        let nib = UINib(nibName: "LandImageCell", bundle: nil)
        imageTb.registerNib(nib, forCellReuseIdentifier: "customCell")
        self.navigationItem.title = "gini"
        
         btng = UIButton()
        // btn.setTitle("Video", forState: UIControlState.Normal)
        let image = UIImage(named:"g") as UIImage?
        btng.setBackgroundImage(image, forState: UIControlState.Normal)
             btng.frame.size = CGSizeMake(50, 50)
        
    let horizontalCenter: CGFloat = UIScreen.mainScreen().bounds.size.width / 2.0
        
   btng.center = CGPoint(x: horizontalCenter, y: UIScreen.mainScreen().bounds.size.height / 1.4)
        
        
         btng.addTarget(self, action:"gBtn:", forControlEvents: UIControlEvents.TouchUpInside)
       
        
        self.view.addSubview(btng)

        var n = VideoArr.count
        n = n * 380
        
       basevwHgt.constant = 200 + CGFloat(n) + 450
        tablHgt.constant =  CGFloat(n)
       // tablHgt.constant = tablHgt.constant  + CGFloat(n)
        // basevwHgt.constant = basevwHgt.constant + CGFloat(n)
       
        if bannerVideo.count == 0 {
            [CommonFunctions.alertTitle("", withMessage: "Internet connection failure")]
            // vw.bringSubviewToFront(img)
            
        }else{
            videoPlay(vw1)
            videoPlay(vw2)
            
        }

      
      
        
    }
       func videoPlay(vw : UIView){
       
     
        videoPlayerController = PBJVideoPlayerController()
        videoPlayerController!.delegate = self;
        
        
        videoPlayerController!.view.frame = CGRectMake(10, 0, self.view.frame.width - 20, vw.frame.height)
               let btn = UIButton()
       
        let image = UIImage(named:"VideoImg") as UIImage?
        btn.setBackgroundImage(image, forState: UIControlState.Normal)
        btn.frame = CGRectMake(self.view.frame.width - 60, 140, 30, 30)
        
        // btn.addTarget(self, action:"navigation:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.addTarget(self, action:"navigation:", forControlEvents: UIControlEvents.TouchUpInside)
        // button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        videoPlayerController?.view.addSubview(btn)
        print(videoPlayerController?.view.frame)
        let img = UIImageView()
        img.frame = CGRectMake(10, 0, self.view.frame.width - 20, vw.frame.height)
        img.image = UIImage(named:"lodingBannerImg")
        vw.addSubview(img)
        vw.bringSubviewToFront(img)

        vw.addSubview(videoPlayerController!.view)
        
        
        self.addChildViewController(videoPlayerController!)
        
        videoPlayerController!.didMoveToParentViewController(self)
        videoPlayerController!.asset = AVURLAsset(URL:NSURL(string:bannerVideo.objectAtIndex(0) as! String)!, options: nil)
        videoPlayerController?.playFromBeginning()
        videoPlayerController?.muted = true
       /* if bannerVideo.count == 0 {
            [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
           // vw.bringSubviewToFront(img)
            
        }else{
            videoPlayerController!.asset = AVURLAsset(URL:NSURL(string:bannerVideo.objectAtIndex(0) as! String)!, options: nil)
            videoPlayerController?.playFromBeginning()
            videoPlayerController?.muted = true
            
        }*/
        
        
        
        
        
      
        
    }
   /* override func viewDidAppear(animated: Bool) {
        videoPlay(vw1)
        videoPlay(vw2)
        

    }*/
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
        
        if bannerVideo.count == 0 {
            [CommonFunctions.alertTitle("", withMessage: "Internet connection failure")]
            // vw.bringSubviewToFront(img)
            
        }else{
            videoPlay(vw1)
            videoPlay(vw2)
            
        }
        

        
        
    }
    override func viewWillDisappear(animated: Bool) {
        
        
       videoPlayerController?.stop()
       // VideoArr = []
        
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
        var visibleRect = CGRect()
        visibleRect.size = tp.bounds.size
        visibleRect.origin = tp.contentOffset
        var containedViewRect = CGRect()
        containedViewRect = vw1.bounds
       
        
        if ( CGRectContainsRect( visibleRect, containedViewRect) && !vw1.hidden )
        {
            videoPlay(vw1)
            videoPlay(vw2)
          // The view is visible!
        }
        
       
        
        
    }
        
   
    func navigation(sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: VideoDetailVC = storyboard.instantiateViewControllerWithIdentifier("VideoVC") as! VideoDetailVC
        
        menuViewController.imgArr = arr3
        menuViewController.c = topArr.count
        navigationController?.pushViewController(menuViewController, animated: true)
        NSLog("flatButtonPressed")
    }
   
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        return 1
        
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
            return  VideoArr.count
        
       
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
            
            cell2 = imageTb.dequeueReusableCellWithIdentifier("Cell") as! ImageCell
    
            videoPlayerController = PBJVideoPlayerController()
            videoPlayerController!.delegate = self;
         print("font size \(cell2.lbl1.font)")
             videoPlayerController!.view.frame = CGRectMake(0, 0, 160, cell2.videoView.bounds.height + 10)
        let img = UIImageView()
        img.frame = CGRectMake(0, 0, 150, cell2.videoView.bounds.height)

        img.image = UIImage(named:"lodingBannerImg")
        cell2.videoView.addSubview(img)
        cell2.videoView.bringSubviewToFront(img)

       
        let btn = UIButton()
       
        let image = UIImage(named:"VideoImg") as UIImage?
        btn.setBackgroundImage(image, forState: UIControlState.Normal)
        
        btn.addTarget(self, action:"navigation1:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.frame = CGRectMake(120, 240, 30, 30)
       
        videoPlayerController?.view.addSubview(btn)

        let btn1 = UIButton()
       
        let image1 = UIImage(named:"New1") as UIImage?
        btn1.setBackgroundImage(image1, forState: UIControlState.Normal)

     
        btn1.setTitleColor(UIColor.whiteColor(), forState:.Normal)
        btn1.backgroundColor = UIColor.blackColor()
       btn1.titleLabel!.font = UIFont(name:"Georgia", size:12)
       btn1.frame = CGRectMake(0, 0, 37, 25)
        
       videoPlayerController?.view.addSubview(btn1)
        let btn2 = UIButton()
         btn2.backgroundColor = UIColor.blackColor()
       btn2.titleLabel!.font = UIFont(name:"Georgia", size: 12)
       // btn2.setTitle("LIMITED", forState: UIControlState.Normal)
        let image2 = UIImage(named:"limited1") as UIImage?
        btn2.setBackgroundImage(image2, forState: UIControlState.Normal)
       // btn2.titleLabel?.textAlignment = NSTextAlignment.Center
        btn2.frame = CGRectMake(0, 260, 64, 25)
        videoPlayerController?.view.addSubview(btn2)

        self.addChildViewController(videoPlayerController!)
        cell2.addSubview(videoPlayerController!.view)
        videoPlayerController!.didMoveToParentViewController(self)
            
           videoPlayerController!.asset = AVURLAsset(URL:NSURL(string:VideoArr.objectAtIndex(indexPath.row) as! String)!, options: nil)
        videoPlayerController?.muted = true
        
          arr = topArr.objectAtIndex(indexPath.row) as! NSArray
          arr2 = subCatName.objectAtIndex(indexPath.row) as! NSArray
        print("arr\(arr)")
        print("arr2\(arr2)")
        
        
        if arr2.count == 1 && arr.count == 1{
            cell2.lbl1.text = (arr2.objectAtIndex(0)  as! String)
            cell2.img1.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(0)  as! String), placeholderImage: UIImage(named:"loading.png"))
            
             cell2.lbl2.hidden = true
             cell2.lbl3.hidden = true
             cell2.lbl4.hidden = true
             cell2.img2.hidden = true
             cell2.img3.hidden = true
             cell2.img4.hidden = true
           
              cell2.vim2.hidden = true
            cell2.vim3.hidden = true
            cell2.vim4.hidden = true
            cell2.sim2.hidden = true
            cell2.sim3.hidden = true
            cell2.sim4.hidden = true

           

            
        }else if arr2.count == 2 && arr.count == 2 {
            
             cell2.lbl1.text = (arr2.objectAtIndex(0)  as! String)
             cell2.lbl2.text = (arr2.objectAtIndex(1)  as! String)
            
            cell2.img1.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(0)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img2.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(1)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.lbl3.hidden = true
            cell2.lbl4.hidden = true
            cell2.img3.hidden = true
            cell2.img4.hidden = true
           
            cell2.vim3.hidden = true
            cell2.vim4.hidden = true
            cell2.sim3.hidden = true
            cell2.sim4.hidden = true

            
        }else if arr2.count == 3 && arr.count == 3 {
            cell2.lbl1.text = (arr2.objectAtIndex(0)  as! String)
            cell2.lbl2.text = (arr2.objectAtIndex(1)  as! String)
            cell2.lbl3.text = (arr2.objectAtIndex(2)  as! String)
            print("font size \(cell2.lbl1.font)")

            cell2.img1.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(0)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img2.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(1)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img3.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(2)  as! String), placeholderImage: UIImage(named:"loading.png"))
             cell2.lbl4.hidden = true
             cell2.img4.hidden = true
             cell2.vim4.hidden = true
             cell2.sim4.hidden = true

            
        }else if arr2.count == 4 && arr.count == 4 {
            cell2.lbl1.text = (arr2.objectAtIndex(0)  as! String)
            cell2.lbl2.text = (arr2.objectAtIndex(1)  as! String)
            cell2.lbl3.text = (arr2.objectAtIndex(2)  as! String)
            cell2.lbl4.text = (arr2.objectAtIndex(3)  as! String)
            cell2.img1.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(0)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img2.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(1)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img3.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(2)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img4.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(3)  as! String), placeholderImage: UIImage(named:"loading.png"))
            
        }else if arr2.count == 0{
            
            cell2.lbl1.hidden = true
            cell2.lbl2.hidden = true
            cell2.lbl3.hidden = true
            cell2.lbl4.hidden = true
            cell2.img2.hidden = true
            cell2.img2.hidden = true
            cell2.img3.hidden = true
            cell2.img4.hidden = true
            cell2.vim1.hidden = true
            cell2.vim2.hidden = true
            cell2.vim3.hidden = true
            cell2.vim4.hidden = true
            cell2.vm5.hidden = true
            cell2.sim1.hidden = true
            cell2.sim2.hidden = true
            cell2.sim3.hidden = true
            cell2.sim4.hidden = true

            
        }
        
        

            return cell2
        
    }
    func navigation1(sender: UIButton) {
        
        let buttonPosition = sender.convertPoint(CGPointZero, toView: imageTb) as CGPoint
        let indexPath = imageTb.indexPathForRowAtPoint(buttonPosition)! as NSIndexPath
        print("indexPath\(indexPath.row)")

        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: coordinateVC = storyboard.instantiateViewControllerWithIdentifier("Coordinate") as! coordinateVC
        
         menuViewController.imgArr = arr3
        menuViewController.urlStr = VideoArr.objectAtIndex(indexPath.row) as! NSString
        navigationController?.pushViewController(menuViewController, animated: true)
        NSLog("flatButtonPressed")
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       
      return 358.0
    }
   

   /* func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
       
        // let progressHUD = MBProgressHUD.showHUDAddedTo(cell2.videoView, animated: true)
           videoPlayerController!.asset = AVURLAsset(URL:NSURL(string:VideoArr.objectAtIndex(indexPath.row) as! String)!, options: nil)
           // progressHUD.hide(true)
        
             videoPlayerController?.playFromBeginning()
         videoPlayerController?.muted = true
           
  

    }*/
    
    
   func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
       
            videoPlayerController?.stop()
        // cell2.backgroundColor = UIColor.whiteColor()

        
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        
        
        
       return "NEW COORDINATES"
    }
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            
            headerView.textLabel?.textAlignment = .Center
            headerView.contentView.backgroundColor = UIColor.whiteColor()
            headerView.textLabel?.font = UIFont(name:"YuGo", size:20)
        }
    }
    
     func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let selectionColor = UIView() as UIView
        selectionColor.layer.borderWidth = 1
        selectionColor.layer.borderColor = UIColor.whiteColor().CGColor
        selectionColor.backgroundColor = UIColor.whiteColor()
        cell.selectedBackgroundView = selectionColor
        let progressHUD = MBProgressHUD.showHUDAddedTo(cell2.videoView, animated: true)
        videoPlayerController!.asset = AVURLAsset(URL:NSURL(string:VideoArr.objectAtIndex(indexPath.row) as! String)!, options: nil)
        // progressHUD.hide(true)
        
        videoPlayerController?.playFromBeginning()
        videoPlayerController?.muted = true

    }
    
   /* func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        videoPlayerController?.muted = false
        
    }*/
    
    
    func videoApiCall(){
        
        if !(CommonFunctions.reachabiltyCheck()){
            [CommonFunctions .alertTitle("", withMessage: "Internet connection failure")]
            
        }else{
            let url:NSURL = NSURL(string:"http://103.1.172.70/GINI/gini/index.php/REST/Coordinates/get_all_coordinates")!
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
            NSLog("Response code: %ld", res.statusCode);
            if res.statusCode == 200
            {
                do
                {
                    let dic = try NSJSONSerialization.JSONObjectWithData(data1, options:.MutableContainers) as! NSDictionary
                    //  print(dic)
                    
                    
                    arr3 = dic.valueForKey("result")?.valueForKey("sub_coors") as! NSArray
                    catArr = (dic.valueForKey("result")?.valueForKey("coor_name"))! as! NSArray
                    VideoArr = (dic.valueForKey("result")?.valueForKey("video"))! as! NSArray
                    // japanName = (dic.valueForKey("result")?.valueForKey("sharath"))! as! NSArray
                    
                    for str in arr3{
                        
                        let str1  = str.valueForKey("product_image")  as! NSArray
                        let str2  = str.valueForKey("category_name")  as! NSArray
                        let str3  = str.valueForKey("product_id")  as! NSArray
                        
                        
                        productIdArr.addObject(str3)
                        topArr.addObject(str1)
                        
                        subCatName.addObject(str2)
                        
                        
                    }
                    app.imgArr = topArr
                    
                    print("topArr\(topArr)")
                    print("subCatName\(subCatName)")
                    // print("productIdArr\(productIdArr)")
                    
                    //print("video\(VideoArr)")
                    imageTb.reloadData()
                    
                    
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
    func BannerVideoApiCall(){
        if !(CommonFunctions.reachabiltyCheck()){
            [CommonFunctions .alertTitle("", withMessage: "Internet connection failure")]
            
        }else{
            
            
            let url:NSURL = NSURL(string: "http://103.1.172.70/GINI/gini/index.php/REST/Banners/getallbanners")!
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
                [CommonFunctions.alertTitle("", withMessage: "Internet conncetion may slow.please try again")]
                
            }
            
            
            let res = response as! NSHTTPURLResponse!;
            NSLog("Response code: %ld", res.statusCode);
            if res.statusCode == 200
            {
                do
                {
                    let dic = try NSJSONSerialization.JSONObjectWithData(data1, options:.MutableContainers) as! NSDictionary
                    //  print(dic)
                    
                    
                    bannerVideo = dic.valueForKey("result")?.valueForKey("video_path") as! NSArray
                    
                    
                    
                    imageTb.reloadData()
                    
                    
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

    func videoPlayerBufferringStateDidChange(videoPlayer: PBJVideoPlayerController!) {
        
    }
    func videoPlayerPlaybackStateDidChange(videoPlayer: PBJVideoPlayerController!) {
        
    }
    func videoPlayerReady(videoPlayer: PBJVideoPlayerController!) {
        
    }
    func videoPlayerPlaybackDidEnd(videoPlayer: PBJVideoPlayerController!) {
        
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
        FavDetailApi()
        
       /* let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: FavoratesPage = storyboard.instantiateViewControllerWithIdentifier("Fav") as! FavoratesPage
        
        navigationController?.pushViewController(menuViewController, animated: true)*/
        
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
                        
                    }
                }
                else
                {
                    
                    
                }
                
                
                
            }
            catch (_){
                
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

    func cartCountApi(){
        
        
        
        
        if ((NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue) != nil) {
            
            
           // let strParams =  "&customer_id=" + ((NSUserDefaults.standardUserDefaults().valueForKey("userId"))! as! String) +  "&product_id=" + (imgst as String)
          //  let data = strParams.dataUsingEncoding(NSUTF8StringEncoding)! as NSData
            
            
           // let url:NSURL = NSURL(string:"http://103.1.172.70/GINI/gini/index.php/REST/Cart/add_to_cart?")!
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
                        
                    }
                }
                else
                {
                    
                    
                }
                
                
                
            }
            catch (_){
                
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
                      print("dic\(dic.valueForKey("cart_count") as! Int)")
                       // cartCount = dic.valueForKey("cart_count") as! Int
                        //  btn1.setTitle("NEW", forState: UIControlState.Normal)
                        newViewController.cartCount!.setTitle(String(cartCount), forState: .Normal)
                        
                        
                        
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
    
    func FavDetailApi(){
        
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
                        
                    }
                }
                else
                {
                    
                    
                }
                
            }
        }else {
            print("goto LoginPage")
            let storyboard : UIStoryboard = UIStoryboard(
                name: "Main",
                bundle: nil)
            let menuViewController: SignUpPage = storyboard.instantiateViewControllerWithIdentifier("SignUpPage") as! SignUpPage
            
            self.presentViewController(menuViewController, animated:true, completion:nil)
        }
        
           /* let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Favourites/favourites?device_id=%d",app.deviceID)
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
                        
                    }
                }
                else
                {
                    
                    
                }
                
                
                
            }
            catch (_){
                
            }*/
            
            
            
        
        
        
        
    }

    
    
    
    
    
    
    
    @IBAction func popUpBtnCall(sender: AnyObject) {
        
        
        let buttonPosition = sender.convertPoint(CGPointZero, toView: imageTb) as CGPoint
        let indexPath = imageTb.indexPathForRowAtPoint(buttonPosition)! as NSIndexPath
        print("indexPath\(indexPath.row)")
        
       let newViewController = PopUpViewViewController(nibName: "PopUpViewViewController", bundle: nil)
    //newViewController.view.frame = CGRectMake(0, 0, 375, 300)
        newViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, 200)
        
        imageTb.addSubview( newViewController.view)
        
        
      //  self.addChildViewController(newViewController)
        
         //newViewController.didMoveToParentViewController(self)
        
         //Present View "Modally"
       // self.presentViewController(newViewController, animated: true, completion: nil)
        // Blur Effect
      
        
        
    }
    
    
    @IBAction func nextPopUpAPICall(sender: AnyObject) {
       
        //let indexPath = imageTb.indexPathForSelectedRow!
        //print("indexPath\(indexPath)")
       // let indexPath = cell.b
      //  print("indexPath\(indexPath)")
        let buttonPosition = sender.convertPoint(CGPointZero, toView: imageTb) as CGPoint
        let indexPath = imageTb.indexPathForRowAtPoint(buttonPosition)! as NSIndexPath
        print("indexPath\(indexPath.row)")
        
       
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: PopUpVC = storyboard.instantiateViewControllerWithIdentifier("PopUpVC") as! PopUpVC
      
        let ar = productIdArr.objectAtIndex(indexPath.row) as! NSArray
        menuViewController.imgst = ar.objectAtIndex(0) as!NSString
       
        navigationController?.pushViewController(menuViewController, animated: true)
        
        
        
    }
    
    
    @IBAction func bottomNavigationCall(sender: AnyObject) {
        let buttonPosition = sender.convertPoint(CGPointZero, toView: imageTb) as CGPoint
        let indexPath = imageTb.indexPathForRowAtPoint(buttonPosition)! as NSIndexPath
        print("indexPath\(indexPath.row)")
        
        
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: PopUpVC = storyboard.instantiateViewControllerWithIdentifier("PopUpVC") as! PopUpVC
        
        let ar = productIdArr.objectAtIndex(indexPath.row) as! NSArray
        menuViewController.imgst = ar.objectAtIndex(1) as!NSString
        
        navigationController?.pushViewController(menuViewController, animated: true)
    }
    
    @IBAction func showNavigationCall(sender: AnyObject) {
        let buttonPosition = sender.convertPoint(CGPointZero, toView: imageTb) as CGPoint
        let indexPath = imageTb.indexPathForRowAtPoint(buttonPosition)! as NSIndexPath
        print("indexPath\(indexPath.row)")
        
        
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: PopUpVC = storyboard.instantiateViewControllerWithIdentifier("PopUpVC") as! PopUpVC
        
        let ar = productIdArr.objectAtIndex(indexPath.row) as! NSArray
        menuViewController.imgst = ar.objectAtIndex(2) as!NSString
        
        navigationController?.pushViewController(menuViewController, animated: true)
    }
    
    @IBAction func accNavigationCall(sender: AnyObject) {
        let buttonPosition = sender.convertPoint(CGPointZero, toView: imageTb) as CGPoint
        let indexPath = imageTb.indexPathForRowAtPoint(buttonPosition)! as NSIndexPath
        print("indexPath\(indexPath.row)")
        
        
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: PopUpVC = storyboard.instantiateViewControllerWithIdentifier("PopUpVC") as! PopUpVC
        
        let ar = productIdArr.objectAtIndex(indexPath.row) as! NSArray
        menuViewController.imgst = ar.objectAtIndex(3) as!NSString
        
        navigationController?.pushViewController(menuViewController, animated: true)
    }
    func adaptivePresentationStyleForPresentationController(
        controller: UIPresentationController) -> UIModalPresentationStyle {
            return .None
    }
    
   
    
}

