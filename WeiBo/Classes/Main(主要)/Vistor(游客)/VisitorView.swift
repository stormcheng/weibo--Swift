//
//  VisitorView.swift
//  WeiBo
//
//  Created by sugar on 16/8/12.
//  Copyright © 2016年 爱博看. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    
    // MARK: - propertise
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var registorBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - 快速创建对象 类方法
    class func visitorView() -> VisitorView{
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).first as! VisitorView
    }
    
    // MARK: - 修改visitView数据
    func setupVisitorViewInfo(iconName : String, title : String) {
        iconView.image = UIImage(named: iconName)
        infoLabel.text = title
        rotationView.hidden = true
    }
    
    // MARK: - 转盘动画
    func startRotate() -> Void {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.repeatCount = MAXFLOAT
        animation.duration = 5
        animation.removedOnCompletion = false
        rotationView.layer.addAnimation(animation, forKey: nil)
        
    }
}
