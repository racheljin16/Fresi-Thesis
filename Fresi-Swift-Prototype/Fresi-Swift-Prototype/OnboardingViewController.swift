//
//  OnboardingViewController.swift
//  Fresi-Swift-Prototype
//
//  Created by Rachel Jin on 12/7/16.
//  Copyright © 2016 Rachel Jin. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var logInView: UIImageView!
    @IBOutlet weak var skipView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: 1125, height: 667)
        scrollView.delegate = self
        logInView.alpha = 0
        skipView.alpha = 0
        pageIndicator.alpha = 1
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page : Int = Int(round(scrollView.contentOffset.x / 375))
        pageIndicator.currentPage = page
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let offset = Float(scrollView.contentOffset.x)
        
        if offset >= 750 {
            UIView.animate(withDuration: 0.3, animations: {
                self.logInView.alpha = 1
                self.skipView.alpha = 1
            })
            
            self.pageIndicator.alpha = 0
        }
        else {
            self.logInView.alpha = 0
            self.skipView.alpha = 0
            self.pageIndicator.alpha = 1
            
        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
