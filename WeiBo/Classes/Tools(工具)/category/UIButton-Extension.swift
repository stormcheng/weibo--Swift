//
//  UIButton-Extension.swift
//  WeiBo
//
//  Created by sugar on 16/8/13.
//  Copyright © 2016年 爱博看. All rights reserved.
//

import UIKit

extension UIButton{
    
    convenience init(infoTitle:String,imageName:String,selectedImgName:String){
        self.init()
        setImage(UIImage(named: "navigationbar_arrow_\(imageName)"), forState: .Normal)
        setImage(UIImage(named: "navigationbar_arrow_\(selectedImgName)"), forState: .Selected)
        setTitle(infoTitle, forState: .Normal)
        
        
    }
//    func <#name#>(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
}
