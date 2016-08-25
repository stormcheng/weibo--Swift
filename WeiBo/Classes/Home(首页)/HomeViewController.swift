//
//  HomeViewController.swift
//  WeiBo
//
//  Created by sugar on 16/8/10.
//  Copyright © 2016年 爱博看. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    // MARK: - 懒加载
    lazy var titleBtn : UIButton = TitleButton()
    lazy var poperManager : PoperTransitionManager = {
       PoperTransitionManager(callBack: {[weak self] (isPresenting) in
        self?.titleBtn.selected = isPresenting
       })
    }()
    // MARK: - 系统调用函数
    override func viewDidLoad(){
        super.viewDidLoad()
        // 游客视图时旋转转盘
        visitorView.startRotate()
        // 设置navigationBar
        setupNavBarButtonItem()
    }
}

// MARK: - 设置UI
extension HomeViewController{
    /// 设置navigationBar
    func setupNavBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "pop")
        navigationItem.titleView = titleBtn
        titleBtn.addTarget(self, action: #selector(HomeViewController.titleBtnClick(_:)), forControlEvents: .TouchUpInside)
    }
}
// MARK: - 监听事件
extension HomeViewController{
    @objc private func titleBtnClick(titleBtn :UIButton){
        // 创建并设置控制器
        let poperVC = PoperViewController()
        poperVC.modalPresentationStyle = .Custom
        poperVC.transitioningDelegate = poperManager
        poperManager.frameForPresentingView = CGRect(x: 100, y: 54, width: 180, height: 250)
        // modal出控制器
        presentViewController(poperVC, animated: true, completion: nil)
        
    }
}