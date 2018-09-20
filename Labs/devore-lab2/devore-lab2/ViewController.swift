//
//  ViewController.swift
//  devore-lab2
//
//  Created by Andrea DeVore on 9/19/18.
//  Copyright © 2018 Andrea DeVore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var imageSwitch: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var textBlack: UIButton!
    @IBOutlet weak var textBrown: UIButton!
    
    func updateContent() {
        // changes picture and text
        if imageSwitch.selectedSegmentIndex == 0 {
            descriptionLabel.text = "i put coffee in my coffee"
            drinkImage.image=UIImage(named: "coffee")
        }
        else if imageSwitch.selectedSegmentIndex == 1 {
            descriptionLabel.text = "tea is the elixir of life"
            drinkImage.image=UIImage(named: "tea")
        }
    }
    
    func updateCaps() {
        // changes to caps if on or lowercase if off
        if capitalSwitch.isOn{
            descriptionLabel.text=descriptionLabel.text?.uppercased()
        }
        else {
            descriptionLabel.text=descriptionLabel.text?.lowercased()
        }
    }

    @IBAction func changeCaps(_ sender: UISwitch) {
        updateCaps()
    }
    
    @IBAction func changeContent(_ senvder: UISegmentedControl) {
        updateContent()
        updateCaps()
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value //float
        fontSizeLabel.text=String(format: "%.0f", fontSize) //convert float to String
        let fontSizeCGFloat=CGFloat(fontSize) //convert float to CGFloat
        
        //create a UIFont object and assign to the font property
        descriptionLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    @IBAction func changeFontColor(_ sender: UIButton) {
        if sender.tag == 0 {
            descriptionLabel.textColor=UIColor.black
        }
        else if sender.tag == 1 {
            descriptionLabel.textColor=UIColor.brown
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

