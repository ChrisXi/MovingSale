//
//  LabelTestVC.swift
//  MovingSale
//
//  Created by Xi Yang on 2/5/16.
//  Copyright © 2016 Xi Yang. All rights reserved.
//

import UIKit

class LabelTestVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.text = "jdjdjd\nkdkdkdk"
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
