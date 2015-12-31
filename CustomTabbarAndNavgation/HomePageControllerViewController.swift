//
//  HomePageControllerViewController.swift
//  CustomTabbarAndNavgation
//
//  Created by 袁鹏 on 15/12/30.
//  Copyright © 2015年 CrazyMouse. All rights reserved.
//

import UIKit

protocol HiddenTabBarDelegate {
    func hiddenTabBar(isHidden: Bool)
}

class HomePageControllerViewController: UIViewController {
    
    var hiddenTabBar: HiddenTabBarDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "动态"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClicked(sender: UIButton) {
        let sb = UIStoryboard.init(name: "HomePageStoryboard", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("homechild_sid") as! HomeChildController
        self.navigationController?.pushViewController(vc, animated: true)
        //隐藏tabbar
        self.hiddenTabBar?.hiddenTabBar(true)
    }
    
    //显示tabbar
    override func viewWillAppear(animated: Bool) {
        self.hiddenTabBar?.hiddenTabBar(false)
    }
}
