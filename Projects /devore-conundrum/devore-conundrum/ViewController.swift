//
//  ViewController.swift
//  devore-conundrum
//
//  Created by Andrea on 10/10/18.
//  Copyright © 2018 Andrea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var riddleText: UITextView!  // connection to riddle
    // array of class of riddles
    var myRiddles=[
        Riddle(newRiddle:"hello", newSolution:"world"),
        Riddle(newRiddle:"good", newSolution:"dog"),
        Riddle(newRiddle:"incredible", newSolution:"people")
    ];
    
    var prevRiddles = [Int]();

    @IBAction func nextButton(_ sender: UIBarButtonItem) {
        if sender.tag==1 {
            riddleText.text=myRiddles[1].riddle;
        }
        else if sender.tag==2 {
            riddleText.text=myRiddles[0].riddle;
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
        riddleText.text=myRiddles[3].riddle
//        let arrayLength = String(myRiddles.count)
//        riddleText.text = arrayLength
        for element in myRiddles {
            print(element.riddle, terminator: " ")
        }
//        riddleText.text = myRiddles[3].riddle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
