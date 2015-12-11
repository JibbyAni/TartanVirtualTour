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
    let tourStops = TourStops()


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
    
        performSegueWithIdentifier("infoSegue", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "infoSegue" {
            let tstop = tourStops.stops[0]
            let detailsVC:TourStopInfoViewController = segue.destinationViewController as! TourStopInfoViewController
            detailsVC.tourStop = tstop
        }
    }

    
    @IBAction func browseOptions(){
        
        newLocation.getCurrentLocation()
        dataManager.location = newLocation
        dataManager.saveLocations()
        
        performSegueWithIdentifier("mySegue", sender: self)

        
        
    }


}

