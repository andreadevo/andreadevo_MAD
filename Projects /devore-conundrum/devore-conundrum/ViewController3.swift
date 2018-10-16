//
//  ViewController3.swift
//  devore-conundrum
//
//  Created by Andrea on 10/12/18.
//  Copyright © 2018 Andrea. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UITextViewDelegate {

    @IBOutlet weak var riddleEntry: UITextView!
    @IBOutlet weak var solutionEntry: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(ViewController3.keyboardWillShow(_:)),
            name: Notification.Name.UIKeyboardWillShow,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(ViewController3.keyboardWillHide(_:)),
            name: Notification.Name.UIKeyboardWillHide,
            object: nil
        )

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // ALLOWS USER TO SCROLL W/ KEYBOARD: https://www.raywenderlich.com/560-uiscrollview-tutorial-getting-started
    func adjustInsetForKeyboardShow(_ show: Bool, notification: Notification) {
        let userInfo = notification.userInfo ?? [:]
        let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let adjustmentHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
        scrollView.contentInset.bottom += adjustmentHeight
        scrollView.scrollIndicatorInsets.bottom += adjustmentHeight
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        adjustInsetForKeyboardShow(true, notification: notification)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        adjustInsetForKeyboardShow(false, notification: notification)
    }

    
    // PREPARES SEGUE TO VIEWCONTROLLER1 - CONUNDRUM
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "unwindSave" {
            let vc = segue.destination as! ViewController1
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
    
    // referenced code to shift view: https://stackoverflow.com/questions/35699570/how-to-move-view-if-only-a-certain-textview-is-selected
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.view.frame.origin.y -= 200
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.frame.origin.y += 200
    }

    // followed tutorial for alert with segue: https://stackoverflow.com/questions/34576489/how-can-i-make-a-segue-not-occur-if-a-condition-isnt-met
    //CHECK IF TEXT FIELD IS POPULATED
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "unwindSave" {
            if riddleEntry.text.isEmpty == true {
                let alert=UIAlertController(title: "Missing Text", message: "Both Riddle and Solution text fields should be filled.", preferredStyle: UIAlertControllerStyle.alert)
                let okAction=UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true)
                return false
            }
        }
        return true
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
