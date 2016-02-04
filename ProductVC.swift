//
//  ProductVC.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 09/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class ProductVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var im6: UIImageView!
    
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var productCV: UICollectionView!
    
    @IBOutlet weak var cart: UIButton!
    @IBOutlet weak var sticPrize2lb: UILabel!
    @IBOutlet weak var sticPrize1: UILabel!
    @IBOutlet weak var sticDiscLbl: UILabel!
    @IBOutlet weak var sticImg: UIImageView!
    var ccell = ProductCell()
 
     var app = UIApplication.sharedApplication().delegate as! AppDelegate
    var img = NSString()
    var disc = NSString()
    var sizeDis = NSString()
    var productName = NSString()
    var dic = NSDictionary()
    var imgArr1 = NSArray()
    var dicDetail = NSDictionary()
    var productId = Int()
    var productIDArr = NSArray()
    var colArr = NSArray()
    var productImgArr = NSArray()
    
    @IBOutlet weak var diclbl: UILabel!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.navigationItem.title = "コーデ詳細"
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        let attributes = [NSFontAttributeName : UIFont(name:"Georgia", size: 15)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.navigationController!.navigationBar.titleTextAttributes = attributes
        diclbl.numberOfLines = 10
        diclbl.preferredMaxLayoutWidth =  self.view.frame.size.width - 40
        diclbl.text =  "肉厚のしっかりとした、BOX型シルエットのニットです。コットンで肌触りが良く、静電気など敏感な季節にも嬉しいアイテム"
        productCV.delegate = self
        productCV.dataSource = self
        numberOfProducts()
        ProductDetailApiCall(productId )
        if productImgArr.count == 0 {
            
        }else if productImgArr.count == 1 {
            img1.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(0))! as! String), placeholderImage: UIImage(named:"loading.png"))
            
            
        }else if productImgArr.count == 2{
            img1.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(0))! as! String), placeholderImage: UIImage(named:"loading.png"))
            img2.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(1))! as! String), placeholderImage: UIImage(named:"loading.png"))
           
            
        }else if productImgArr.count == 3{
            img1.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(0))! as! String), placeholderImage: UIImage(named:"loading.png"))
            img2.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(1))! as! String), placeholderImage: UIImage(named:"loading.png"))
            img3.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(2))! as! String), placeholderImage: UIImage(named:"loading.png"))
          
            
        } else if productImgArr.count == 4{
            img1.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(0))! as! String), placeholderImage: UIImage(named:"loading.png"))
            img2.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(1))! as! String), placeholderImage: UIImage(named:"loading.png"))
            img3.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(2))! as! String), placeholderImage: UIImage(named:"loading.png"))
            img4.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(3))! as! String), placeholderImage: UIImage(named:"loading.png"))
            
        }
        sticImg.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(0))! as! String), placeholderImage: UIImage(named:"loading.png"))
        //sticDiscLbl.text = productName.objectAtIndex(0) as? String
        
        
        if (dic.valueForKey("result")?.valueForKey("is_markdown")?.objectAtIndex(0).intValue)!   == 0 {
            
            sticPrize1.text = "¥" + ((dic.valueForKey("result")?.valueForKey("price")?.objectAtIndex(0))! as! String) as NSString as String
            sticPrize2lb.hidden = true
            
        }else if (dic.valueForKey("result")?.valueForKey("is_markdown")?.objectAtIndex(0).intValue)!   == 1 {
            
        }
     /* img1.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(0))! as! String), placeholderImage: UIImage(named:"loading.png"))
        img2.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(1))! as! String), placeholderImage: UIImage(named:"loading.png"))
        img3.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(2))! as! String), placeholderImage: UIImage(named:"loading.png"))
        img4.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(3))! as! String), placeholderImage: UIImage(named:"loading.png"))*/
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func pressed (sender:UIButton!) {
        
        //write the code for changing view controller
        
    }
    @IBOutlet weak var btn4Call: UIButton!
    @IBAction func btn3Call(sender: AnyObject) {
        
    
         ProductDetailApiCall(productIDArr.objectAtIndex(2).integerValue )
         sticImg.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(2))! as! String), placeholderImage: UIImage(named:"loading.png"))
    }
    @IBAction func btn2Call(sender: AnyObject) {
        ProductDetailApiCall(productIDArr.objectAtIndex(1).integerValue )
         sticImg.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(1))! as! String), placeholderImage: UIImage(named:"loading.png"))
    }
    @IBAction func btn1Call(sender: AnyObject) {
        
   
        ProductDetailApiCall(productIDArr.objectAtIndex(0).integerValue )
        
        sticImg.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(0))! as! String), placeholderImage: UIImage(named:"loading.png"))
        
        
    }
    
    @IBAction func btn4Call(sender: AnyObject) {
         ProductDetailApiCall(productIDArr.objectAtIndex(3).integerValue )
         sticImg.sd_setImageWithURL(NSURL(string:(dic.valueForKey("result")?.valueForKey("product_image")?.objectAtIndex(3))! as! String), placeholderImage: UIImage(named:"loading.png"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfProducts(){
        let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Products/coordinate_details_by_product_id?product_id=%d",productId)
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
                productIDArr = (dic.valueForKey("result")?.valueForKey("product_id"))! as! NSArray
                productImgArr = (dic.valueForKey("result")?.valueForKey("product_image"))! as! NSArray
              
                
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
    func ProductDetailApiCall(productId : Int){
      
        let st = NSString(format:"http://103.1.172.70/GINI/gini/index.php/REST/Coordinates/products_by_product_id?product_id=%d",productId)
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
                dicDetail = try NSJSONSerialization.JSONObjectWithData(data1, options:.MutableContainers) as! NSDictionary
               // print(dicDetail)
                colArr = []
                colArr = (dicDetail.valueForKey("result")?.valueForKey("images")) as! NSArray
                print("arr\(colArr)")
                
                
            print(colArr.objectAtIndex(0).count)
                productCV.reloadData()
                
                
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
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return colArr.objectAtIndex(0).count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        
        ccell  = productCV.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ProductCell
       
     /*ccell.productImg.sd_setImageWithURL(NSURL(string:dicDetail.valueForKey("result")?.valueForKey("images")?.objectAtIndex(0).objectAtIndex(indexPath.row).valueForKey("product_image") as! String), placeholderImage: UIImage(named:"loading.png"))*/
        let arr = colArr.objectAtIndex(0).valueForKey("product_image") as! NSArray
        ccell.productImg.sd_setImageWithURL(NSURL(string:arr.objectAtIndex(indexPath.row) as! String), placeholderImage: UIImage(named:"loading.png"))
        
        
        
        return ccell
    }
   /* func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: 150, height: 300)
    }*/
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
 
    @IBAction func CartApiCall(sender: AnyObject) {
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
