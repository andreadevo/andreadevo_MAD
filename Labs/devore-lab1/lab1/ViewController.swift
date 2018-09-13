//
//  ViewController.swift
//  lab1
//
//  Created by Andrea DeVore on 9/10/18.
//  Copyright © 2018 Andrea DeVore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBAction func chooseImage(_ sender: UIButton) {
        if sender.tag == 1 {
            dayImage.image=UIImage(named:"morning")
            dayLabel.text = "good morning!"
        }
        else if sender.tag == 2 {
            dayImage.image=UIImage(named:"night")
            dayLabel.text = "good night!"

        }
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

