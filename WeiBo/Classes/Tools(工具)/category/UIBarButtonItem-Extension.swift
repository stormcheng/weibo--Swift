//
//  UIBarButtonItem_Extension.swift
//  WeiBo
//
//  Created by sugar on 16/8/12.
//  Copyright © 2016年 爱博看. All rights reserved.
//  用于快速创建UIBarButtonItme

import UIKit

extension UIBarButtonItem{
    /// 创建高亮图片button
    convenience init(imageName:String){
        let btn = UIButton(type: .Custom)
        btn.setImage(UIImage(named: "navigationbar_\(imageName)"), forState: .Normal)
        btn.setImage(UIImage(named: "navigationbar_\(imageName)_highlighted"), forState: .Highlighted)
        btn.sizeToFit()
        self.init(customView:btn)
    }
}