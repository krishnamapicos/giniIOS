//
//  FavoratesPage.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 20/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class FavoratesPage: UIViewController, UITableViewDelegate, UITableViewDataSource , UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, PBJVideoPlayerControllerDelegate{

    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var favTb: UITableView!
    @IBOutlet weak var favCollVw: UICollectionView!
     var cell2 = ImageCell()
    var ccell = FavCollectionCell()
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
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
    var productIdArr = NSMutableArray()
    var index = Int()
    var arr3 =  NSArray()
    var favDic = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "お気に入り"
        
        let attributes = [NSFontAttributeName : UIFont(name:"Georgia", size: 15)!, NSForegroundColorAttributeName : UIColor.blackColor()]
        self.navigationController!.navigationBar.titleTextAttributes = attributes
        
        
        
        favTb.delegate = self
        favTb.dataSource = self
        favCollVw.delegate = self
        favCollVw.dataSource = self
        // favCollVw.registerNib(UINib(nibName:"FavCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cellIdentifier")
   favCollVw.registerNib(UINib(nibName:"FavCollectionCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        favCollVw.hidden = true
      
      
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.topItem!.title = " "
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btn1Call(sender: AnyObject) {
        
      btn1.backgroundColor = UIColor.blackColor()
      btn1.tintColor = UIColor.whiteColor()
        favTb.hidden = false
        favCollVw.hidden = true
       
        
        
    }
    @IBAction func btn2Call(sender: AnyObject) {
        
        favTb.hidden = true
        favCollVw.hidden = false
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return  VideoArr.count
        
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        cell2 = favTb.dequeueReusableCellWithIdentifier("Cell") as! ImageCell
        
        
        
        
        return cell2
        
    }
   /* func navigation1(sender: UIButton) {
        
        let buttonPosition = sender.convertPoint(CGPointZero, toView: favTb) as CGPoint
        let indexPath = favTb.indexPathForRowAtPoint(buttonPosition)! as NSIndexPath
        print("indexPath\(indexPath.row)")
        
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let menuViewController: coordinateVC = storyboard.instantiateViewControllerWithIdentifier("Coordinate") as! coordinateVC
        
        menuViewController.imgArr = arr3
        menuViewController.urlStr = VideoArr.objectAtIndex(indexPath.row) as! NSString
        navigationController?.pushViewController(menuViewController, animated: true)
        NSLog("flatButtonPressed")
    }*/
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 358.0
    }
    
    
    
    
    
  
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return (favDic.valueForKey("favourite_products")?.valueForKey("product_image")?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        // favCollVw.registerNib(UINib(nibName:"FavCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cellIdentifier")
        
        ccell  = favCollVw.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! FavCollectionCell
        
        
        ccell.img.sd_setImageWithURL(NSURL(string:favDic.valueForKey("favourite_products")?.valueForKey("image")?.objectAtIndex(indexPath.row) as! String), placeholderImage: UIImage(named:"loading.png"))
        
        
        if (favDic.valueForKey("favourite_products")?.valueForKey("is_markdown")?.objectAtIndex(indexPath.row).intValue)!   == 0 {
            
            ccell.prize1.text  =  "¥" + (favDic.valueForKey("favourite_products")?.valueForKey("price")?.objectAtIndex(indexPath.row) as! String)  as NSString as String
            ccell.prize2.hidden = true
            
        }else if (favDic.valueForKey("favourite_products")?.valueForKey("product_image")?.objectAtIndex(indexPath.row).intValue)!   == 1 {
            
        }
        

    
        
        
        return ccell
    }
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: 150, height: 300)
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
