//
//  HomeChildController.swift
//  CustomTabbarAndNavgation
//
//  Created by 袁鹏 on 15/12/31.
//  Copyright © 2015年 CrazyMouse. All rights reserved.
//

import UIKit

class HomeChildController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutUI()
    }
    
    func layoutUI() {
        let backBtn: UIButton = UIButton(type: UIButtonType.Custom)
        backBtn.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        backBtn.setTitle("返回", forState: UIControlState.Normal)
        backBtn.setTitleColor(UIColor.brownColor(), forState: UIControlState.Normal)
        backBtn.titleLabel?.font = UIFont.systemFontOfSize(13)
        backBtn.setBackgroundImage(UIImage(named: "nav_backBtn"), forState: UIControlState.Normal)
        backBtn.setBackgroundImage(UIImage(named: "nav_backBtn"), forState: UIControlState.Highlighted)
        backBtn.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
    }
    
    func back() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
