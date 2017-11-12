//
//  MarketViewController.swift
//  Fresi-Swift-Prototype
//
//  Created by Rachel Jin on 11/30/16.
//  Copyright © 2016 Rachel Jin. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var heroScrollView: UIScrollView!
    @IBOutlet weak var listScrollView: UIScrollView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var hero1View: UIImageView!
    @IBOutlet weak var Hero2View: UIImageView!
    @IBOutlet weak var Hero3View: UIImageView!
    @IBOutlet weak var Hero4View: UIImageView!
    
    var lightBoxTransition: LightBoxTransition!
    var selectedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heroScrollView.contentSize = CGSize(width: 1500, height: 211)
        heroScrollView.delegate = self
        listScrollView.contentSize = CGSize(width: 375, height: 1055)
        listScrollView.delegate = self
        
        lightBoxTransition = LightBoxTransition()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page : Int = Int(round(heroScrollView.contentOffset.x / 375))
        pageControl.currentPage = page
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        listScrollView.contentInset.top = 0
        listScrollView.contentInset.bottom = 50
        listScrollView.scrollIndicatorInsets.top = 0
        listScrollView.scrollIndicatorInsets.bottom = 50
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! PhotoViewController
        destinationVC.image = self.selectedImageView.image
        destinationVC.modalPresentationStyle = .custom
        destinationVC.transitioningDelegate = self.lightBoxTransition
    }
    

    @IBAction func onTapPhotos(_ sender: UITapGestureRecognizer) {
            selectedImageView = sender.view as! UIImageView
            performSegue(withIdentifier: "toPhotoSegue", sender: nil)
            selectedImageView.frame = sender.view!.frame
    }
    
    
    @IBAction func didTapBack(_ sender: UIButton) {
        
                navigationController?.popToRootViewController(animated: true)
         
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
