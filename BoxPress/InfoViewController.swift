//
//  InfoViewController.swift
//  BoxPress
//
//  Created by Yoshikuni Kato on 7/10/16.
//  Copyright © 2016 Yoshikuni Kato. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, StoryboardInstantiable {

    @IBAction func dismissSelf(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
