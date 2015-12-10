//
//  ViewController.swift
//  TartanVirtualTour
//
//  Created by Jibby Ani on 12/6/15.
//  Copyright (c) 2015 Jibby Ani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dataManager = DataManager()
    let newLocation = Location()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startTour(){
        
        newLocation.getCurrentLocation()
        dataManager.location = newLocation
        dataManager.saveLocations()
    
//    
//    let alert = UIAlertController(title: "Welcome to Campus!", message: dataManager.generateMessage(), preferredStyle: .Alert)
//        
//    alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler:{ action in self.))
        performSegueWithIdentifier("mySegue", sender: self)
//    presentViewController(alert, animated: true, completion: nil)
        
        
    }

}

