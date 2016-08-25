//
//  MainViewController.swift
//  WeiBo
//
//  Created by sugar on 16/8/10.
//  Copyright © 2016年 爱博看. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
       // MARK: - 懒加载
    private lazy  var publishBtn = UIButton(type: .Custom)
    
       // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPublishBtn()
     }
}
   // MARK: - 设置UI界面
extension MainViewController {
    /// 设置发布按钮
    private func setupPublishBtn() -> Void {
        //1.设置图片
        publishBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        publishBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        publishBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        publishBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        //2.设置位置
        publishBtn.sizeToFit()
        publishBtn.center = CGPointMake(tabBar.center.x, tabBar.bounds.size.height*0.5)
        //3.添加相应事件
        publishBtn.addTarget(self, action: #selector(MainViewController.publishClick), forControlEvents: .TouchUpInside)
        //4.添加到tabbar
        tabBar.addSubview(publishBtn)

    }
    
@objc private func publishClick() -> Void {
        print("publish")
    }
}