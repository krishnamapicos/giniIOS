//
//  ShopPage.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 27/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class ShopPage: UIViewController,HTHorizontalSelectionListDataSource,HTHorizontalSelectionListDelegate ,UICollectionViewDelegate,UICollectionViewDataSource{
    @IBOutlet weak var mineTb: NSLayoutConstraint!
    @IBOutlet weak var tabViewAttribute: NSLayoutConstraint!
    
    @IBOutlet weak var myShopCV: UICollectionView!
    @IBOutlet weak var selectionList: HTHorizontalSelectionList!
    var  ccell = ShopCell1()
    var imgArr = NSArray()
    var c = Int()
    var a = NSMutableArray()
    var im = NSMutableArray()
    var p1 = NSMutableArray()
    var name = NSMutableArray()
    var mark = NSMutableArray()
    var dic = NSDictionary()

    
 // var selectionList : HTHorizontalSelectionList!
    var Arr = ["商品","コーデ","インタビュー","店舗情報"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        
        
        self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationItem.title = "ヘッダー"
        // self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        let attributes = [NSFontAttributeName : UIFont(name:"Georgia", size: 15)!, NSForegroundColorAttributeName : UIColor.blackColor()]
        self.navigationController!.navigationBar.titleTextAttributes = attributes
               shopApiCall()
        
        selectionList.dataSource = self
        selectionList.delegate = self
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        selectionList.selectionIndicatorAnimationMode = HTHorizontalSelectionIndicatorAnimationMode.LightBounce
        selectionList.showsEdgeFadeEffect = true
        selectionList.selectionIndicatorColor = UIColor.blackColor()
        
        selectionList.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        selectionList.setTitleFont(UIFont.systemFontOfSize(13), forState: UIControlState.Normal)
        selectionList.setTitleFont(UIFont.boldSystemFontOfSize(13), forState: UIControlState.Selected)
        selectionList.setTitleFont(UIFont.boldSystemFontOfSize(13), forState: UIControlState.Highlighted)
        myShopCV.dataSource = self
        myShopCV.delegate = self
          myShopCV.registerNib(UINib(nibName:"ShopCell1", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
      //  self.view.addSubview(selectionList)


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.topItem!.title = " "
        
    }
    func scrollViewDidScrollToTop(scrollView: UIScrollView) {
        
        tabViewAttribute.constant = 0
        mineTb.constant = 0
        
    
    }
    func numberOfItemsInSelectionList(selectionList: HTHorizontalSelectionList!) -> Int {
        return Arr.count
    }
    func selectionList(selectionList: HTHorizontalSelectionList!, didSelectButtonWithIndex index: Int) {
        
        
        if index == 0 {
            myShopCV.hidden = false
            
            
        }else if index == 1 {
            
             myShopCV.hidden = true
            
        }
        
    }
    func selectionList(selectionList: HTHorizontalSelectionList!, titleForItemWithIndex index: Int) -> String! {
        // return self.carMakes[index] as! String
        
        // print("  arr\( arr)")
        return Arr[index]
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return (dic.valueForKey("result")?.valueForKey("image")?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
       
        
        ccell  = myShopCV.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ShopCell1
        
       
        ccell.img.sd_setImageWithURL(NSURL(string:dic.valueForKey("result")?.valueForKey("image")?.objectAtIndex(indexPath.row) as! String), placeholderImage: UIImage(named:"loading.png"))
        
        if ((dic.valueForKey("result")?.valueForKey("is_markdown")?.objectAtIndex(indexPath.row))!.intValue)!   == 0 {
            
            ccell.prize1.text  =  "¥" + ((dic.valueForKey("result")?.valueForKey("price")?.objectAtIndex(indexPath.row))! as! String)
           ccell.prize2.hidden = true
            
        }else if ((dic.valueForKey("result")?.valueForKey("is_markdown")?.objectAtIndex(indexPath.row))!.intValue)!   == 1 {
           // ccell.prize1.text  =  "¥" + ((dic.valueForKey("result")?.valueForKey("price")?.objectAtIndex(indexPath.row))! as! String)
          //  ccell.prize2.hidden = true
            
        }
        ccell.discLb.numberOfLines = 5
        ccell.discLb.preferredMaxLayoutWidth = self.view.frame.size.width/2
        ccell.discLb.text = dic.valueForKey("result")?.valueForKey("product_name")?.objectAtIndex(indexPath.row) as? String
       

        
        return ccell
    }
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: 150, height: 300)
    }
    func shopApiCall(){
        
        let url:NSURL = NSURL(string:"http://103.1.172.70/GINI/gini/index.php/REST/Products/shop_products?shop_id=1")!
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
                
                
                /*arr3 = dic.valueForKey("result")?.valueForKey("sub_coors") as! NSArray
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
                app.imgArr = topArr
                
                print("topArr\(topArr)")
                print("subCatName\(subCatName)")*/
                // print("productIdArr\(productIdArr)")
                
                //print("video\(VideoArr)")
                
            }
                
                
            catch ( _)
                
            {
                Crittercism.logError(error)
                print("Crittercism.logError(error)\(  Crittercism.logError(error))")
                
            }
            
        }
        else
        {
            print("server error")
            Crittercism.logError(error)
            
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
