//
//  MyPageVC.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 26/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var myTb: UITableView!
    var headersArr = ["購入者設定","ヘルプ","このアプリについて"]
    var headersArr1 = ["購入者設定","ヘルプ","このアプリについて",""]
    var row1Arr = ["ログイン","設定","閲覧履歴"]
    var row12Arr = ["ユーザー情報","設定","閲覧履歴","購入履歴"]
     var row2Arr = ["サポート"]
     var row3Arr = ["利用規約","プライバシーポリシー","運営会社","Youtuber募集","アプリのバージョン"]
    var row4Arr = ["ログアウト"]
    var cell2 = myPageCell()
    var headers = NSArray!()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //headersArr = ["購入者設定","ヘルプ","このアプリについて"]
        //row1Arr = ["ログイン","設定","閲覧履歴"]
        //row2Arr = ["サポート"]
       // row3Arr = ["利用規約","プライバシーポリシー","運営会社","Youtuber募集","アプリのバージョン"]
        
        self.navigationItem.title = "マイページ"
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        myTb.dataSource = self
        myTb.delegate = self
        myTb.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        if ((NSUserDefaults.standardUserDefaults().valueForKey("userId")?.intValue) != nil) {
            
            headers = ["購入者設定","ヘルプ","このアプリについて",""]
        
        }
        
        // Dispose of any resources that can be recreated.
       
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.topItem!.title = " "
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        //return headersArr.count
        print("headersArr\(headersArr.count)")
        return  headersArr.count

        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if section == 0{
            return row1Arr.count
            
        }else if section == 1{
            return row2Arr.count
            
        }
        return row3Arr.count
        // return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
       // let cell:UITableViewCell = myTb.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        cell2 = myTb.dequeueReusableCellWithIdentifier("Cell") as! myPageCell
      //  cell2.myLb.text = "my"
        
          //  cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier:"Cell")
        
        if indexPath.section == 0 {
            cell2.myLb.text = row1Arr[indexPath.row]
            
        }else if indexPath.section == 1 {
             cell2.myLb.text = row2Arr[indexPath.row]
            
        }else if indexPath.section == 2 {
             cell2.myLb.text = row3Arr[indexPath.row]
            
        }

        
       // cell.textLabel?.text = self.items[indexPath.row]
        
        return cell2
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("You selected cell #\(indexPath.row)!")
        if indexPath.section == 0 && indexPath.row == 0 {
            let storyboard : UIStoryboard = UIStoryboard(
                name: "Main",
                bundle: nil)
            let menuViewController: SignUpPage = storyboard.instantiateViewControllerWithIdentifier("SignUpPage") as! SignUpPage
            
            navigationController?.pushViewController(menuViewController, animated: true)
            
 
            
        }
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        
        
        return headersArr[section]
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
