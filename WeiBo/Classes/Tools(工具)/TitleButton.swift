//
//  TitleButton.swift
//  WeiBo
//
//  Created by sugar on 16/8/13.
//  Copyright © 2016年 爱博看. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame:frame)
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Selected)
        setTitle("fsfsfsf", forState: .Normal)
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel!.chb_x = 0
        imageView!.chb_x = titleLabel!.chb_right + 5
    }
}
