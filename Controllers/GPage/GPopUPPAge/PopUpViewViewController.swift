//
//  PopUpViewViewController.swift
//  GiniDemo
//
//  Created by MAPICOS IT PVT LTD on 05/01/16.
//  Copyright © 2016 MAPICOS IT PVT LTD. All rights reserved.
//

import UIKit

class PopUpViewViewController: UIViewController {
    @IBOutlet weak var v1: UIView!

    @IBOutlet weak var cartCount: UIButton!
    @IBOutlet weak var accBtn: UIButton!
    @IBOutlet weak var seachBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var gbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = UIColor(patternImage:UIImage(named:"BC")!)
      //  self.view.backgroundColor = UIColor.grayColor()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func gBtnCall(sender: AnyObject) {
        
        
        self.view.hidden = true
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
