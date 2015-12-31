//
//  RootTabViewController.swift
//  CustomTabbarAndNavgation
//
//  Created by 袁鹏 on 15/12/30.
//  Copyright © 2015年 CrazyMouse. All rights reserved.
//

import UIKit

class RootTabViewController: UITabBarController, ChangeTabBarDelegate, HiddenTabBarDelegate {
    
    var tabBarView: CustomTabBar?
    var homeVC: HomePageControllerViewController?
    /**
     *更改controller
     */
    func changeIndex(index: Int) {
        print("index = \(index)")
        self.selectedIndex = index
    }
    
    /**
     *隐藏tabbar
     */
    func hiddenTabBar(isHidden: Bool) {
        print("isHidden = \(isHidden)")
        tabBarView?.hidden = isHidden
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
        
        customTabBar()
    }
    
    /**
     *初始化内容区
     */
    func initViewController() {
        //动态
        let homeController = UIStoryboard.init(name: "HomePageStoryboard", bundle: nil).instantiateInitialViewController() as! UINavigationController
        
        homeController.navigationBar.setBackgroundImage(UIImage(named: "navigation_bg"), forBarMetrics: UIBarMetrics.Default)
        homeVC = homeController.childViewControllers[0] as? HomePageControllerViewController

        //精选
        let handPickerController = UIStoryboard.init(name: "HandPicker", bundle: nil).instantiateInitialViewController() as! UINavigationController
        handPickerController.navigationBar.setBackgroundImage(UIImage(named: "navigation_bg"), forBarMetrics: UIBarMetrics.Default)
        
        //图片博客
        let pictureController = UIStoryboard.init(name: "Picture", bundle: nil).instantiateInitialViewController() as! UINavigationController
        pictureController.navigationBar.setBackgroundImage(UIImage(named: "navigation_bg"), forBarMetrics: UIBarMetrics.Default)
        
        //音乐
        let musicController = UIStoryboard.init(name: "Music", bundle: nil).instantiateInitialViewController() as! UINavigationController
        musicController.navigationBar.setBackgroundImage(UIImage(named: "navigation_bg"), forBarMetrics: UIBarMetrics.Default)
        
        //更多
        let moreController = UIStoryboard.init(name: "More", bundle: nil).instantiateInitialViewController() as! UINavigationController
        moreController.navigationBar.setBackgroundImage(UIImage(named: "navigation_bg"), forBarMetrics: UIBarMetrics.Default)
        
        let tabBarControllers = [homeController, handPickerController, pictureController, musicController, moreController]
        
        self.setViewControllers(tabBarControllers, animated: true)
    }
    
    /**
     *初始化tabbar
     */
    func customTabBar() {
        self.tabBar.hidden = true
        var array = NSBundle.mainBundle().loadNibNamed("CustomTabBar", owner: self, options: nil)
        tabBarView = array[0] as? CustomTabBar
        tabBarView?.delegate = self
        tabBarView?.btn_home.selected = true
        tabBarView?.frame = CGRect(x: 0, y: self.view.frame.height-49, width: self.view.frame.width, height: 49)
        self.view.addSubview(tabBarView!)
        
        homeVC?.hiddenTabBar = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     *禁止横屏
     */
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}
