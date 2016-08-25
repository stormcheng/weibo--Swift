//
//  BaseViewController.swift
//  WeiBo
//
//  Created by sugar on 16/8/12.
//  Copyright © 2016年 爱博看. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
    // MARK: - 懒加载
    lazy var visitorView = VisitorView.visitorView()
    var isLogin : Bool = false
    
    // MARK: - loadView
    override func loadView() {
        //确定展示视图
        isLogin ? super.loadView(): setupVistorView()
    }
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isLogin {
        setupNavBarItem()
        }
    }
}
// MARK: - 设置UI
extension BaseViewController{
    /// 设置游客视图
    private func setupVistorView(){
        view = visitorView
        //给登录注册按钮添加事件
        visitorView.loginBtn.addTarget(self, action: #selector(BaseViewController.loginClick), forControlEvents: .TouchUpInside)
        visitorView.registorBtn.addTarget(self, action: #selector(BaseViewController.registerClick), forControlEvents: .TouchUpInside)
    }
    /// 设置导航栏左右按钮
    private func setupNavBarItem(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(BaseViewController.registerClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: #selector(BaseViewController.loginClick))
    }
}
// MARK: - 点击事件
extension BaseViewController{
    @objc private func registerClick(){
        print("register")
    }
    @objc private func loginClick(){
        print("login")
    }
}