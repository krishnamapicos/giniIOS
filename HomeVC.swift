//
//  HomeVC.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 08/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class HomeVC: UIViewController,PBJVideoPlayerControllerDelegate,UITableViewDataSource,UITableViewDelegate, UIAlertViewDelegate,UIPopoverPresentationControllerDelegate,UIScrollViewDelegate,UINavigationControllerDelegate{
    var data = NSMutableArray()
    var headers = NSMutableArray()
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
    
    @IBOutlet weak var hmtb: STCollapseTableView!
    var app = UIApplication.sharedApplication().delegate as! AppDelegate

   
    override func viewDidLoad() {
        super.viewDidLoad()
        videoApiCall()
        BannerVideoApiCall()
        hmtb.delegate = self
        hmtb.dataSource = self
        let nib = UINib(nibName: "LandImageCell", bundle: nil)
        hmtb.registerNib(nib, forCellReuseIdentifier: "customCell")
        self.navigationController?.title = "Gini"
        
      //  hmtb.openSection(0, animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViewController() {
        
        
        //let colors = [UIColor.redColor(),UIColor.orangeColor(),UIColor.yellowColor(),UIColor.grayColor(),UIColor.blueColor(),UIColor.purpleColor()] as NSArray
        var i = Int()
        for (i  = 0; i < 2; i++) {
            let section = NSMutableArray()
            
           // let ar = bannerVideo.objectAtIndex(i) as! NSArray
            //subCatArr = subCategoryID[i] as! NSArray
            
            //for device in ar{
                section.addObject(i)
                
            //}
            
            
            data.addObject(section)
            
        }
        
        for (var i = 0 ; i < 2 ; i++) {
            
            let header = UIView()
            header.frame = CGRectMake(0, 0,self.view.frame.size.width, 150)
            header.backgroundColor = UIColor.redColor()
            let img = UIImageView()
            img.frame = CGRectMake(0, 0, self.view.frame.size.width, 118)
            img.backgroundColor = UIColor.purpleColor()
            
            header.addSubview(img)
            let lbl = UILabel()
            
            lbl.frame = CGRectMake(0, 121, header.frame.size.width, 20.0)
            
            lbl.textAlignment = NSTextAlignment.Center
            
            header.addSubview(lbl)
            
            lbl.text = "New"
            
            headers.addObject(header)
            
        }
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        cell2 = hmtb.dequeueReusableCellWithIdentifier("Cell") as! ImageCell
        
       /* videoPlayerController = PBJVideoPlayerController()
        videoPlayerController!.delegate = self;
        // cell.videoView.backgroundColor = UIColor(patternImage:UIImage(named:"Loading")!)
       // let progressHUD = MBProgressHUD.showHUDAddedTo(cell2.videoView, animated: true)
        // videoPlayerController!.view.frame = cell2.videoView.bounds
        //videoPlayerController!.view.frame = CGRectMake(0, 0, 140, cell2.videoView.bounds.height)
       // videoPlayerController!.view.frame = CGRectMake(0, 0, 140, cell2.videoView.bounds.height)
        
        
        
        self.addChildViewController(videoPlayerController!)
       //
       // cell2.videoView.addSubview(videoPlayerController!.view)
      //  videoPlayerController!.didMoveToParentViewController(self)
        
       // videoPlayerController!.asset = AVURLAsset(URL:NSURL(string:VideoArr.objectAtIndex(indexPath.row) as! String)!, options: nil)
        
        arr = topArr.objectAtIndex(indexPath.row) as! NSArray
        arr2 = subCatName.objectAtIndex(indexPath.row) as! NSArray
        if indexPath.row == 0 {
            
            //cell2.popBtn.hidden = false
            
        }else{
           // cell2.popBtn.hidden = true
            
        }
        
        if arr2.count == 1 {
            cell2.lbl1.text = (arr2.objectAtIndex(0)  as! String)
            cell2.img1.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(0)  as! String), placeholderImage: UIImage(named:"loading.png"))
            
            cell2.lbl2.hidden = true
            cell2.lbl3.hidden = true
           // cell2.lbl4.hidden = true
            cell2.img2.hidden = true
            cell2.img3.hidden = true
           // cell2.img4.hidden = true
            
            
            
        }else if arr2.count == 2 {
            cell2.lbl1.text = (arr2.objectAtIndex(0)  as! String)
            cell2.lbl2.text = (arr2.objectAtIndex(1)  as! String)
            
            cell2.img1.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(0)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img2.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(1)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.lbl3.hidden = true
           // cell2.lbl4.hidden = true
            cell2.img3.hidden = true
           // cell2.img4.hidden = true
            
        }else if arr2.count == 3 {
            cell2.lbl1.text = (arr2.objectAtIndex(0)  as! String)
            cell2.lbl2.text = (arr2.objectAtIndex(1)  as! String)
            cell2.lbl3.text = (arr2.objectAtIndex(2)  as! String)
            
            cell2.img1.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(0)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img2.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(1)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img3.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(2)  as! String), placeholderImage: UIImage(named:"loading.png"))
           // cell2.lbl4.hidden = true
           // cell2.img4.hidden = true
            
        }else if arr2.count == 4{
            cell2.lbl1.text = (arr2.objectAtIndex(0)  as! String)
            cell2.lbl2.text = (arr2.objectAtIndex(1)  as! String)
            cell2.lbl3.text = (arr2.objectAtIndex(2)  as! String)
           // cell2.lbl4.text = (arr2.objectAtIndex(3)  as! String)
            cell2.img1.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(0)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img2.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(1)  as! String), placeholderImage: UIImage(named:"loading.png"))
            cell2.img3.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(2)  as! String), placeholderImage: UIImage(named:"loading.png"))
          //  cell2.img4.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(4)  as! String), placeholderImage: UIImage(named:"loading.png"))
            
        }*/
        
        
        
        return cell2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.objectAtIndex(section).count
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 150
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return headers.objectAtIndex(section) as? UIView
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func videoApiCall(){
        
        let url:NSURL = NSURL(string: "http://103.1.172.70/GINI/gini/index.php/REST/Coordinates/get_all_coordinates")!
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
                let dic = try NSJSONSerialization.JSONObjectWithData(data1, options:.MutableContainers) as! NSDictionary
                //  print(dic)
                
                
                let arr3 = dic.valueForKey("result")?.valueForKey("sub_coors") as! NSArray
                catArr = (dic.valueForKey("result")?.valueForKey("coor_name"))! as! NSArray
                VideoArr = (dic.valueForKey("result")?.valueForKey("video"))! as! NSArray
                // japanName = (dic.valueForKey("result")?.valueForKey("sharath"))! as! NSArray
                
                for str in arr3{
                    
                    let str1  = str.valueForKey("category_thumb")  as! NSArray
                    let str2  = str.valueForKey("category_name")  as! NSArray
                    let str3  = str.valueForKey("product_id")  as! NSArray
                    
                    
                    productIdArr.addObject(str3)
                    topArr.addObject(str1)
                    
                    subCatName.addObject(str2)
                    
                    
                }
                print("topArr\(topArr)")
                print("subCatName\(subCatName)")
                // print("productIdArr\(productIdArr)")
                
                //print("video\(VideoArr)")
               // hmtb.reloadData()
                 setupViewController()
                
                
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
    func BannerVideoApiCall(){
        
        
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
            print("Internet conncetion may slow.please try again")
            
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
                
                
                
                hmtb.reloadData()
                
                
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
    
    func videoPlayerBufferringStateDidChange(videoPlayer: PBJVideoPlayerController!) {
        
    }
    func videoPlayerPlaybackStateDidChange(videoPlayer: PBJVideoPlayerController!) {
        
    }
    func videoPlayerReady(videoPlayer: PBJVideoPlayerController!) {
        
    }
    func videoPlayerPlaybackDidEnd(videoPlayer: PBJVideoPlayerController!) {
        
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
