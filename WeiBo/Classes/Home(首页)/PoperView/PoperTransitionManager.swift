//
//  PoperTransitionManager.swift
//  WeiBo
//
//  Created by sugar on 16/8/13.
//  Copyright © 2016年 爱博看. All rights reserved.
//

import UIKit

class PoperTransitionManager: NSObject {
    // MARK: - properties
    /// Modal出view的frame
    var frameForPresentingView = CGRectZero
    /// 是否正在modal
    private var isPresenting : Bool = false
    private var callBack : ((isPresenting : Bool)->())?
    
    
    init(callBack : (isPresenting : Bool)->()) {
        self.callBack = callBack
    }
}
// MARK: - 转场时调用的代理方法
extension PoperTransitionManager : UIViewControllerTransitioningDelegate{
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        callBack!(isPresenting: isPresenting)
        return self
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        callBack!(isPresenting: isPresenting)
        return self
    }
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
                let presentation = CHBPresentationController(presentedViewController: presented, presentingViewController: presenting)
        presentation.frameForPresentingView = frameForPresentingView
        return presentation
    }
}
// MARK: - 转场动画调用的代理方法
extension PoperTransitionManager : UIViewControllerAnimatedTransitioning{
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.1
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        isPresenting ? animationForPresentingView(transitionContext) : animationForDismissView(transitionContext)
    }
}
// MARK: - 自定义转场动画
extension PoperTransitionManager{
    /// 开始动画
    private func animationForPresentingView(transitionContext: UIViewControllerContextTransitioning) {
        let presentingView  = transitionContext.viewForKey(UITransitionContextToViewKey)!
        transitionContext.containerView()?.addSubview(presentingView)
        presentingView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        presentingView.transform = CGAffineTransformMakeScale(1.0, 0.001)
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { 
            presentingView.transform = CGAffineTransformIdentity
            }) { (_) in
                transitionContext.completeTransition(true)
        }
    }
    /// 结束动画
    private func animationForDismissView(transitionContext: UIViewControllerContextTransitioning){
        let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            dismissView.transform = CGAffineTransformMakeScale(1.0, 0.001)
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
}
