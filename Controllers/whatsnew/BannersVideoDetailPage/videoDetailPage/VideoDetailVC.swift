//
//  VideoDetailVC.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 08/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class VideoDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate , PBJVideoPlayerControllerDelegate,UINavigationControllerDelegate, UINavigationBarDelegate{

    @IBOutlet weak var tbht: NSLayoutConstraint!
    @IBOutlet weak var vht: NSLayoutConstraint!
    @IBOutlet weak var htConstant: NSLayoutConstraint!
    @IBOutlet weak var videoTb: UITableView!
    @IBOutlet weak var vw: UIView!
     var cell2 = VideoCell()
    var imgArr = NSArray()
    var c = Int()
    var a = NSMutableArray()
    var im = NSMutableArray()
    var p1 = NSMutableArray()
    var name = NSMutableArray()
    var mark = NSMutableArray()
    var shopName = NSArray()
    var marginArr = NSArray()
    
    @IBOutlet weak var wht: NSLayoutConstraint!
   
     var videoPlayerController : PBJVideoPlayerController?
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
       // self.navigationController!.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    
       // self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
       
    
        let rightButton: UIButton = UIButton(frame: CGRectMake(0, 0, 150, 44))
       
        rightButton.setTitle("コーデ詳細をみる", forState: .Normal)
       rightButton.titleLabel!.font = UIFont(name:"Georgia", size:12)
        rightButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        rightButton.setImage(UIImage(named:"forwordBtn"), forState: .Normal)
       // rightButton.imageEdgeInsets = UIEdgeInsetsMake(<#T##top: CGFloat##CGFloat#>, <#T##left: CGFloat##CGFloat#>, <#T##bottom: CGFloat##CGFloat#>, <#T##right: CGFloat##CGFloat#>)
     rightButton.imageEdgeInsets = UIEdgeInsetsMake(10,CGRectGetWidth(rightButton.frame)-15, 20.0, 10.0)
       
        
        rightButton.addTarget(self, action: "openSharingWindow:", forControlEvents: .TouchUpInside)
       
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
        
        

        
        for str in imgArr{
            
            let str1  = str.valueForKey("category_thumb")  as! NSArray
            let str2  = str.valueForKey("is_markdown")  as! NSArray
            let str3  = str.valueForKey("price")  as! NSArray
            let str4  = str.valueForKey("product_name")  as! NSArray
          //  marginArr = (str.valueForKey("margin"))! as! NSArray
            
           // shopName = (str.valueForKey("shop_name"))! as! NSArray
            

            
            for s in str1 {
                
                im.addObject(s)

            }
            for s in str2 {
                
                mark.addObject(s)
                
            }
            for s in str3 {
                
                p1.addObject(s)
                
            }
            for s in str4 {
                
                name.addObject(s)
                
            }
            
            
        }
        print("im\(im.count)")
        print("im\(im)")
       // var n = im.count
       // n = n * 250
        
      //  wht.constant = wht.constant + CGFloat(n)
      // vht.constant =  CGFloat(n)


      //  print("count\(c)")
        
        
   videoPlay(vw)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.topItem!.title = "もどる "
        
        
    }

    
   /* func openSharingWindow(sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: ProductVC = storyboard.instantiateViewControllerWithIdentifier("ProductVC") as! ProductVC
       // menuViewController.imgArr = imgArr
        
        navigationController?.pushViewController(menuViewController, animated: true)
        NSLog("flatButtonPressed")
    }*/
    func videoPlay(vw1 : UIView){
        
        
        videoPlayerController = PBJVideoPlayerController()
        videoPlayerController!.delegate = self;
        
        
        
         videoPlayerController!.view.frame = CGRectMake(0, 0, self.view.frame.width, 200)
        
        print(videoPlayerController?.view.frame)
        vw.addSubview(videoPlayerController!.view)
       /* let img = UIImageView()
        img.frame = CGRectMake(0, 70, self.view.frame.width, 200)
        img.image = UIImage(named:"play_button")
        self.view.addSubview(img)
        vw.bringSubviewToFront(img)*/
        
        
        
        self.addChildViewController(videoPlayerController!)
        
        videoPlayerController!.didMoveToParentViewController(self)
        
        
        videoPlayerController!.asset = AVURLAsset(URL:NSURL(string:"http://103.1.172.70/GINI/admin/assets/media/videos/banner1.mp4")!, options: nil)
        
        
        
    }
   /* func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
    }*/
    /*func tableView(tableView: UITableView, setSeparatorStyle style: NSInteger) -> NSInteger {
        
        
        
        return cell2.separatorInset
    }*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
       print("im\(im.count)")
         return  im.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        cell2 = videoTb.dequeueReusableCellWithIdentifier("Cell") as! VideoCell
        cell2.im.sd_setImageWithURL(NSURL(string:im.objectAtIndex(indexPath.row)  as! String), placeholderImage: UIImage(named:"loading.png"))
        
        if (mark.objectAtIndex(indexPath.row).intValue)!   == 0 {
            
            cell2.prizelb1.text  =  "¥" + (p1.objectAtIndex(indexPath.row) as! String)  as NSString as String
            cell2.prizelb2.hidden = true
            
        }else if (mark.objectAtIndex(indexPath.row).intValue)!   == 1 {
            
        }
        
         cell2.nameLb.text = name.objectAtIndex(indexPath.row) as! String
        
        
        return cell2
        
    }
    
    
    
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
      
        
        
        
        
        
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let selectionColor = UIView() as UIView
        selectionColor.layer.borderWidth = 1
        selectionColor.layer.borderColor = UIColor.whiteColor().CGColor
        selectionColor.backgroundColor = UIColor.whiteColor()
        cell.selectedBackgroundView = selectionColor
        
    }
   /* func scrollViewDidScroll(scrollView: UIScrollView) {
        
      /*  var previousOffset = CGFloat()
        
        var rect = CGRect()
        rect.origin.y = previousOffset - scrollView.contentOffset.y
        previousOffset = scrollView.contentOffset.y
         self.vw.frame = rect*/
        
        var rect = CGRect()
       
        rect = self.view.frame
        rect.origin.y = -videoTb.contentOffset.y
        
       
        
       //  self.vw.frame = rect
        
        self.view.frame = rect
    }*/
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
