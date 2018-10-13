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
    // followed tutorial on "prepare": https://learnappmaking.com/pass-data-between-view-controllers-swift-how-to/#forward-segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewController2
        {
            let vc = segue.destination as! ViewController2
            vc.solution = "Me"
        }
    }
    
    // UNWINDS SEGUE FROM VIEWCONTROLLER2 - SOLUTION
    @IBAction func unwindSolution(_ segue:UIStoryboardSegue){
    }
    
    // UNWINDS BACK OPTION FROM VIEWCONTROLLER3 - ADD
    @IBAction func unwindBack(_ segue:UIStoryboardSegue){
    }
    
    // UNWINDS SAVE OPTION FROM VIEWCONTROLLER3 - ADD
    @IBAction func unwindSave(_ segue:UIStoryboardSegue){
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
