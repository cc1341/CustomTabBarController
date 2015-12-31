//
//  CustomTabBar.swift
//  CustomTabbarAndNavgation
//
//  Created by 袁鹏 on 15/12/30.
//  Copyright © 2015年 CrazyMouse. All rights reserved.
//

import UIKit

protocol ChangeTabBarDelegate {
    func changeIndex(index: Int)
}

class CustomTabBar: UIView {
    @IBOutlet var btn_home: UIButton!
    @IBOutlet var btn_handPicker: UIButton!
    @IBOutlet var btn_picture: UIButton!
    @IBOutlet var btn_music: UIButton!
    @IBOutlet var btn_more: UIButton!
    @IBOutlet var iv_selected: UIImageView!
    
    var delegate: ChangeTabBarDelegate?
    var one = false, two = true, three = true, four = true, five = true

    @IBAction func ChangeTabBar(sender: UIButton) {
        switch sender {
        case btn_home:
            if one {
                one = false
                two = true
                three = true
                four = true
                five = true
                
                self.btn_home.selected = true
                self.btn_handPicker.selected = false
                self.btn_picture.selected = false
                self.btn_music.selected = false
                self.btn_more.selected = false
                
                self.iv_selected.center = self.btn_home.center
            }
            break
            
        case btn_handPicker:
            if two {
                one = true
                two = false
                three = true
                four = true
                five = true
                
                self.btn_home.selected = false
                self.btn_handPicker.selected = true
                self.btn_picture.selected = false
                self.btn_music.selected = false
                self.btn_more.selected = false
                
                self.iv_selected.center = self.btn_handPicker.center
            }
            break
            
        case btn_picture:
            if three {
                one = true
                two = true
                three = false
                four = true
                five = true
                
                self.btn_home.selected = false
                self.btn_handPicker.selected = false
                self.btn_picture.selected = true
                self.btn_music.selected = false
                self.btn_more.selected = false
                
                self.iv_selected.center = self.btn_picture.center
            }
            break
            
        case btn_music:
            if four {
                one = true
                two = true
                three = true
                four = false
                five = true
                
                self.btn_home.selected = false
                self.btn_handPicker.selected = false
                self.btn_picture.selected = false
                self.btn_music.selected = true
                self.btn_more.selected = false
                
                self.iv_selected.center = self.btn_music.center
            }
            break
            
        case btn_more:
            if five {
                one = true
                two = true
                three = true
                four = true
                five = false
                
                self.btn_home.selected = false
                self.btn_handPicker.selected = false
                self.btn_picture.selected = false
                self.btn_music.selected = false
                self.btn_more.selected = true
                
                self.iv_selected.center = self.btn_more.center
            }
            break
            
        default:
            break
        }
        delegate?.changeIndex(sender.tag)
    }
}
