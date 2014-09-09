//
//  ViewController.swift
//  tips
//
//  Created by Mohit Goenka on 9/7/14.
//  Copyright (c) 2014 mgoenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipPercentage = defaults.integerForKey("default_tip")
        
        if (defaultTipPercentage == 18) {
            tipControl.selectedSegmentIndex = 0
        } else if (defaultTipPercentage == 20) {
            tipControl.selectedSegmentIndex = 1
        } else {
            tipControl.selectedSegmentIndex = 2
        }
        updateTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTip()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateTip() {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = Double((billField.text as NSString).doubleValue)
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}
