//
//  ViewController.swift
//  devore-conundrum
//
//  Created by Andrea on 10/10/18.
//  Copyright © 2018 Andrea. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    @IBOutlet weak var riddleText: UITextView!  // connection to riddle
    var currentPosition : Int = 0               // tracks position in riddleText array
    
    // array of class of riddles
    var myRiddles=[
        Riddle(newRiddle:"What makes more as you take them?", newSolution:"Footsteps"),
        Riddle(newRiddle:"A boy is walking down the road with a doctor. While the boy is the doctor's son, the doctor isn't the boy's father.", newSolution:"The doctor is the boy's mother."),
        Riddle(newRiddle:"The number 8,549,176,320 is a unique number. Can you tell me what is so special about it?", newSolution:"This is the only number which includes all digits arranged in alphabetical order."),
        Riddle(newRiddle:"A man is condemned to death has the option of picking one of the mentioned rooms. The first room is a furnace filled with feeding flames, the second has armed men with loaded guns, the third has lions who have been starving for years. Which one should the man choose?", newSolution:"The third room.")
    ];
    
    func populateRiddle(){
        riddleText.text = myRiddles[currentPosition].riddle
    }
    
    func checkPosition() -> Bool {
        let arrayLength = myRiddles.count
        if currentPosition == arrayLength - 1 {
            // at the end of the array
            return false
        } else {
            // not at end
            return true
        }
    }

    @IBAction func changeRiddle(_ sender: UIBarButtonItem) {
        let arrayLength = myRiddles.count
        if sender.tag==1 {
            // next button, go to next element
            if currentPosition ==  arrayLength - 1 {
                // at end of array, wrap to beginning
                currentPosition = 0
            }
            else {
                currentPosition = currentPosition + 1
            }
            print(currentPosition)
            riddleText.text=myRiddles[currentPosition].riddle
        }
        else if sender.tag==2 {
            // previous button, go to previous element
            if currentPosition == 0 {
                // at beginning of array, wrap to end
                currentPosition = arrayLength - 1
            }
            else {
                currentPosition = currentPosition - 1
            }
            riddleText.text=myRiddles[currentPosition].riddle;
        }
    }
    
    // PREPARES SEGUE TO VIEWCONTROLLER2 - SOLUTION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "gotoSolution"
        {
            let vc2 = segue.destination as! ViewController2
            vc2.solution = myRiddles[1].solution
        }
    }
    
    // UNWINDS SEGUE FROM VIEWCONTROLLER2 - SOLUTION
    @IBAction func unwindSolution(_ segue:UIStoryboardSegue){
    }
    
    // UNWINDS BACK OPTION FROM VIEWCONTROLLER3 - ADD
    @IBAction func unwindBack(_ segue:UIStoryboardSegue){
    }
    
    var myRiddle = Riddle(newRiddle:"",newSolution:"")

    // UNWINDS SAVE OPTION FROM VIEWCONTROLLER3 - ADD
    @IBAction func unwindSave(_ segue:UIStoryboardSegue){
        myRiddles.append(myRiddle)
        print (myRiddles.count)
        for element in myRiddles {
            print(element.riddle, terminator: " ")
        }
    }

    override func viewDidLoad() {
        currentPosition = Int(arc4random_uniform(UInt32(myRiddles.count)))
        print(currentPosition)
        populateRiddle();
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
