//
//  ViewController.swift
//  devore-lab3
//
//  Created by Andrea DeVore on 9/25/18.
//  Copyright © 2018 Andrea DeVore. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var feetInput: UITextField!
    @IBOutlet weak var inchesInput: UITextField!
    @IBOutlet weak var metersOutput: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateMeters() {
        var inches:Float
        var feet: Float
        var calculateMeters : Float = 0.0

        
        // check if inches is empty
        if inchesInput.text!.isEmpty {
            inches=0.0
        } else {
            inches=Float(inchesInput.text!)!
        }
        
        // check if feet is empty, alert!
        let feetCheck=Int(feetInput.text!)  //returns an optional
        if feetCheck != nil {
            if feetCheck! > 0 {
                // no warning
                feet = Float(feetInput.text!)!
                calculateMeters = Float(feet) * 0.3048 + Float(inches) * 0.0254
            } else {
                // warning display
                let alert=UIAlertController(title: "Warning", message: "Small number! It's recommended to use a feet measurement of at least 1.", preferredStyle: UIAlertControllerStyle.alert)
                // create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                let okAction=UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: {action in
                    self.feetInput.text="1"
                    self.updateMeters()
                })
                // add actions
                alert.addAction(cancelAction)
                alert.addAction(okAction)
                present(alert, animated: true)
            }
        }
        
        // calculate meters
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        metersOutput.text = formatter.string(from: NSNumber(value: calculateMeters))
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateMeters()
    }
    
    override func viewDidLoad() {
        feetInput.delegate=self
        inchesInput.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        feetInput.resignFirstResponder()
        inchesInput.resignFirstResponder()
    }
}

