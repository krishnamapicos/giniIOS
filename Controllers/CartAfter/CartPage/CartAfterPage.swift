//
//  CartAfterPage.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 25/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class CartAfterPage: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var totalPrizelb: UILabel!

    @IBOutlet weak var ProductCount: UILabel!
    @IBOutlet weak var CartTb: UITableView!
    var cartDic = NSDictionary()

    var cell2 = CartCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "カート"
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
          self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        CartTb.delegate = self
        CartTb.dataSource = self
        totalPrizelb.text = cartDic.valueForKey("cart_total") as? String
        var cartCount = Int()
        cartCount = (cartDic.valueForKey("cart_count") as? Int)!
        ProductCount.text = "(" + String(cartCount) +  "点の商品)"
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.topItem!.title = " "
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
       
        return (cartDic.valueForKey("result")!.valueForKey("product_name")?.count)!
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        cell2 = CartTb.dequeueReusableCellWithIdentifier("Cell") as! CartCell
        cell2.cartImg.sd_setImageWithURL(NSURL(string:cartDic.valueForKey("result")?.valueForKey("image")?.objectAtIndex(indexPath.row) as! String), placeholderImage: UIImage(named:"loading.png"))
        cell2.cartLb1.text = cartDic.valueForKey("result")!.valueForKey("product_name")?.objectAtIndex(indexPath.row) as? String
        cell2.cartlb2.text = "カラー："  + (cartDic.valueForKey("result")!.valueForKey("color_name")?.objectAtIndex(indexPath.row) as! String )as? String
        cell2.cartlb3.text = "サイズ：" +  (cartDic.valueForKey("result")!.valueForKey("size_short")?.objectAtIndex(indexPath.row) as? String)! as String
        
        if ((cartDic.valueForKey("result")?.valueForKey("is_markdown")?.objectAtIndex(indexPath.row))!.intValue)!   == 0 {
            
           cell2.prize1.text  =  "¥" + ((cartDic.valueForKey("result")?.valueForKey("price")?.objectAtIndex(indexPath.row))! as! String)
           cell2.prize2.hidden = true
            
        }else if ((cartDic.valueForKey("result")?.valueForKey("is_markdown")?.objectAtIndex(indexPath.row))!.intValue)!   == 1 {
            // ccell.prize1.text  =  "¥" + ((dic.valueForKey("result")?.valueForKey("price")?.objectAtIndex(indexPath.row))! as! String)
            //  ccell.prize2.hidden = true
            
        }
        cell2.cartlb4.text = "数量：" + (cartDic.valueForKey("result")!.valueForKey("product_quantity")?.objectAtIndex(indexPath.row) as! String )as? String
        
        return cell2
        
    }
    
    
    
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        
        
        
        
        
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
