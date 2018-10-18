//
//  ViewController.swift
//  devore-iOS_Midterm
//
//  Created by Andrea on 10/18/18.
//  Copyright © 2018 Andrea. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var workoutInput: UITextField!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateWorkout() {
        var time:Float
        var calculateMiles:Float=0.0
        var calculateCalories:Float=0.0
        
        // check if user input
        if workoutInput.text!.isEmpty{
            time=0.0
        } else {
            time=Float(workoutInput.text!)!
        }
        
        // update labels with info
        if time < 30.0 {
            // present workout alert if time < 30 min
            let alert=UIAlertController(title: "Warning! Low Exercise!", message: "Workout should be at least 30 minutes!", preferredStyle: UIAlertControllerStyle.alert)
            // create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
            let okAction=UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: {action in
                self.workoutInput.text="30"
                self.updateWorkout()
            })
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            // calculate miles and calories
            calculateMiles = time/10
            calculateCalories = time/60*600
            
            // display content on screen
            let formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.decimal
            milesLabel.text = formatter.string(from: NSNumber(value: calculateMiles))! + " Miles"
            caloriesLabel.text = formatter.string(from: NSNumber(value: calculateCalories))! + " Calories Burned"
        }
    }
    
    @IBAction func calculateWorkout(_ sender: UIButton) {
        updateWorkout()
    }
        
    override func viewDidLoad() {
        workoutInput.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

