//
//  ViewController.swift
//  devore-lab4
//
//  Created by Andrea on 10/9/18.
//  Copyright © 2018 Andrea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var lastLabel: UILabel!
    
    var user=Name();
    
    let filename="name.plist";
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        firstLabel.text=user.firstName;
        lastLabel.text=user.lastName;
    }
    
    func dataFileURL(_ filename:String) -> URL? {
        // returns an array of URLs for the document directory in the user's home directory
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        var url : URL?
        // append the file name to the first item in the array which is the document directory
        url = urls.first?.appendingPathComponent(filename)
        // return the URL of the data file or nil if it does not exist
        return url
    }
    
    override func viewDidLoad() {
        // url of data file
        let fileURL = dataFileURL(filename)
        
        // CHECK IF DATA FILE EXISTS
        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
            let url = fileURL!
            do {
                //creates a data buffer with the contents of the plist
                let data = try Data(contentsOf: url)
                //create an instance of PropertyListDecoder
                let decoder = PropertyListDecoder()
                //decode the data using the structure of the Favorite class
                user = try decoder.decode(Name.self, from: data)
                //assign data to textfields
                firstLabel.text=user.firstName
                lastLabel.text=user.lastName
            } catch {
                print("no file")
            }
        } else {
            print("file does not exist")
        }
        
        // SAVE DATA WHEN EXIT
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(_:)), name: Notification.Name.UIApplicationWillResignActive, object: app)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    @objc func applicationWillResignActive(_ notification: Notification){
        //url of data file
        let fileURL = dataFileURL(filename)
        //create an instance of PropertyListEncoder
        let encoder = PropertyListEncoder()
        //set format type to xml
        encoder.outputFormat = .xml
        do {
            //encode the data using the structure of the Favorite class
            let plistData = try encoder.encode(user)
            //write encoded data to the file
            try plistData.write(to: fileURL!)
        } catch {
            print("write error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

