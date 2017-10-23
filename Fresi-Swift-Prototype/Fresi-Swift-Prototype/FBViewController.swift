//
//  FBViewController.swift
//  Fresi-Swift-Prototype
//
//  Created by Rachel Jin on 10/22/17.
//  Copyright © 2017 Rachel Jin. All rights reserved.
//

import UIKit

class FBViewController: UIViewController {

    @IBAction func onTapAllow(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Allow 'Fresi' to access your location while you use the app", message: "To find farmers' markets nearby, we need access to your phone's location", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Don't Allow", style: .default) { (action) in
        }
        
        alertController.addAction(cancelAction)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "GoToHomeSegue", sender: nil)
        }
        let allowAction = UIAlertAction(title: "Allow", style: .cancel, handler: callActionHandler)
        
        alertController.addAction(allowAction)
        
        self.present(alertController, animated: true) {
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
