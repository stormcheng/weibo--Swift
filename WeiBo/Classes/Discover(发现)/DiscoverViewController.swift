//
//  DiscoverViewController.swift
//  WeiBo
//
//  Created by sugar on 16/8/10.
//  Copyright © 2016年 爱博看. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView.setupVisitorViewInfo("visitordiscover_image_message", title: "登录后，别人评论你的微博，给你发消息，都会在这里收到通知")

    }
}
