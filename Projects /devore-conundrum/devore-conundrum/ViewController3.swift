//
//  ViewController3.swift
//  devore-conundrum
//
//  Created by Andrea on 10/12/18.
//  Copyright © 2018 Andrea. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var riddleEntry: UITextView!
    @IBOutlet weak var solutionEntry: UITextView!
    
    // PREPARES SEGUE TO VIEWCONTROLLER1 - CONUNDRUM
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "unwindSave"
        {
            let vc = segue.destination as! ViewController
            vc.myRiddle.riddle = riddleEntry.text
            vc.myRiddle.solution = solutionEntry.text
        }
    }
    
    // DISMISS KEYBOARD (RETURN)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // DISMISS KEYBOARD (TAP ON SCREEN)
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        riddleEntry.resignFirstResponder()
        solutionEntry.resignFirstResponder()
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
