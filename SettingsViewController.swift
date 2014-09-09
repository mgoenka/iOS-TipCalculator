//
//  SettingsViewController.swift
//  tipCaluculator
//
//  Created by Mohit Goenka on 9/8/14.
//  Copyright (c) 2014 mgoenka. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    var tipValues = [18, 20, 22]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipPercentage = defaults.integerForKey("default_tip")
        
        if (defaultTipPercentage == tipValues[0]) {
            defaultTipControl.selectedSegmentIndex = 0
        } else if (defaultTipPercentage == tipValues[1]) {
            defaultTipControl.selectedSegmentIndex = 1
        } else {
            defaultTipControl.selectedSegmentIndex = 2
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChange(sender: AnyObject) {
        var defaultTipPercentage = tipValues[defaultTipControl.selectedSegmentIndex]
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipPercentage, forKey: "default_tip")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
