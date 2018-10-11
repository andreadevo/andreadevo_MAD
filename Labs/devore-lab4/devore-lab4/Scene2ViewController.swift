//
//  Scene2ViewController.swift
//  devore-lab4
//
//  Created by Andrea on 10/10/18.
//  Copyright © 2018 Andrea. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userFirst: UITextField!
    @IBOutlet weak var userLast: UITextField!
    
    // DISMISS KEYBOARD (RETURN)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // DISMISS KEYBOARD (TAP ON SCREEN)
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        userFirst.resignFirstResponder()
        userLast.resignFirstResponder()
    }
    
    
    // SAVE DATA USER ENTERS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneName"{
            let Scene1ViewController = segue.destination as! ViewController
            //check to see that text was entered in the textfields
            if userFirst.text!.isEmpty == false{
                Scene1ViewController.user.firstName=userFirst.text
            }
            if userLast.text!.isEmpty == false{
                Scene1ViewController.user.lastName=userLast.text
            }
        }
    }
    
    override func viewDidLoad() {
        userFirst.delegate = self;
        userLast.delegate = self;
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
