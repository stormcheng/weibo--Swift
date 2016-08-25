//
//  CHBPresentationController.swift
//  WeiBo
//
//  Created by sugar on 16/8/13.
//  Copyright © 2016年 爱博看. All rights reserved.
//

import UIKit

class CHBPresentationController: UIPresentationController {
    // MARK: - properties
    /// 设置modal出view的frame
    var frameForPresentingView = CGRectZero
    
    // MARK: - 懒加载
    private lazy var coverView : UIView = UIView()
    
    // MARK: - 系统调用函数
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        //设置尺寸
        presentedView()?.frame = frameForPresentingView
        //添加蒙板
        setupCoverView()
    }
}
// MARK: - UI设置相关
extension CHBPresentationController{
    /// 设置蒙板view
    func setupCoverView() {
        coverView.frame = containerView!.bounds
        containerView?.insertSubview(coverView, atIndex: 0)
        coverView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CHBPresentationController.coverViewClick)))
    }
}
// MARK: - 事件监听
extension CHBPresentationController{
    /// 使modal出的view消失
    func coverViewClick() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}