//
//  UIView-Extension.swift
//  WeiBo
//
//  Created by sugar on 16/8/12.
//  Copyright © 2016年 爱博看. All rights reserved.
//  该分类用于控件的快速位置定位

import UIKit

extension UIView{
    /// 控件的x值
    var chb_x : CGFloat{
        set{
            frame.origin.x = newValue
        }
        get{
           return frame.origin.x
        }
    }
    /// 控件的y值
    var chb_y : CGFloat{
        set{
            frame.origin.y = newValue
        }
        get{
            return frame.origin.y
        }
    }
    /// 控件的宽度
    var chb_width : CGFloat{
        set{
            bounds.size.width = newValue
        }
        get{
            return bounds.size.width
        }
    }
    /// 控件的高度
    var chb_height : CGFloat{
        set{
            bounds.size.height = newValue
        }
        get{
            return bounds.size.height
        }
    }
    /// 控件的右边
    var chb_right:CGFloat{
        set{
            chb_x = newValue - chb_width
        }
        get{
            return chb_x + chb_width
        }
    }
    /// 控件的底部
    var chb_bottom:CGFloat{
        set{
            chb_y = newValue - chb_height
        }
        get{
            return chb_y + chb_height
        }
    }
   
}
