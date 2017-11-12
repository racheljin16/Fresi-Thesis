//
//  LightBoxTransition.swift
//  Facebook
//
//  Created by Rachel Jin on 11/9/16.
//  Copyright © 2016 Rachel. All rights reserved.
//

import UIKit

class LightBoxTransition: BaseTransition {
    
//    var originalY: CGFloat!
    var blackView: UIView!
    
    var transitionImageView: UIImageView!
    var endTransitionImageView: UIImageView!
    var window = UIApplication.shared.keyWindow!

    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        blackView = UIView()
        blackView.frame = fromViewController.view.bounds
        blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        blackView.alpha = 0
        fromViewController.view.addSubview(blackView)
        
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let MarketViewController = navigationController.topViewController as! MarketViewController
        let photoViewController = toViewController as! PhotoViewController
        
        let frame = window.convert(MarketViewController.hero1View.frame, from: MarketViewController.listScrollView)
        
        transitionImageView = UIImageView(frame: frame)
        transitionImageView.contentMode = UIViewContentMode.scaleAspectFit
        transitionImageView.image = MarketViewController.selectedImageView.image
        window.addSubview(transitionImageView)
        
        toViewController.view.alpha = 0
        fromViewController.view.alpha = 1
        
        UIView.animate(withDuration: duration, animations: {
            self.transitionImageView.frame = photoViewController.imageView.frame
            self.blackView.alpha = 0.9
        }) { (finished: Bool) -> Void in
            toViewController.view.alpha = 1
            self.transitionImageView.removeFromSuperview()
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabBarViewController = toViewController as! UITabBarController

        let navigationController = tabBarViewController.selectedViewController as! UINavigationController
        let MarketViewController = navigationController.topViewController as!MarketViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        let frame = window.convert(photoViewController.imageView.frame, from: photoViewController.scrollView)
        let endFrame = window.convert(MarketViewController.hero1View.frame, from: MarketViewController.listScrollView)
        
        endTransitionImageView = UIImageView(frame: frame)
        endTransitionImageView.image = photoViewController.imageView.image
        endTransitionImageView.contentMode = UIViewContentMode.scaleAspectFill
        window.addSubview(endTransitionImageView)
        
        fromViewController.view.alpha = 0
        toViewController.view.alpha = 1
        
        UIView.animate(withDuration: duration, animations: {
            self.blackView.alpha = 0
            self.endTransitionImageView.frame = endFrame
            
        }) { (finished: Bool) -> Void in
            self.endTransitionImageView.removeFromSuperview()
            self.blackView.removeFromSuperview()
            self.finish()
        }
    }
}
