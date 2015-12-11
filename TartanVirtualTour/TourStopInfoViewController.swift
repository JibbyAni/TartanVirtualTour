//
//  TourStopInfoViewController.swift
//  TartanVirtualTour
//
//  Created by Jibby Ani on 12/7/15.
//  Copyright (c) 2015 Jibby Ani. All rights reserved.
//

import MapKit
import UIKit

class TourStopInfoViewController: UIViewController {
    
    @IBOutlet weak var stopImage: UIImageView!
    @IBOutlet weak var stopName: UILabel!
    @IBOutlet weak var stopDescription: UILabel!
    let tourStops = TourStops()

    var tourStop:TourStop?
    var nextStop:TourStop?
    var firstStop:TourStop?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstStop = tourStops.stops.first
        // we need to safely unpack the info tab and display the data
        if let info = tourStop {
            
            stopImage.image = UIImage(named: info.label)
            
            stopName.text = info.stop
            
            stopDescription.text = info.description
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func getDirections(sender: AnyObject) {
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        let info = tourStop
        info!.mapItem().openInMapsWithLaunchOptions(launchOptions)

    }
    
    @IBAction func nextStop(sender: AnyObject) {

        for var i = 0; i < tourStops.stops.count; ++i {
            
            if tourStops.stops[i].stop == tourStop!.stop{

                if i < (tourStops.stops.count - 1) {
                    nextStop = tourStops.stops[i+1]
                    let info = tourStops.stops[i+1]
                    stopImage.image = UIImage(named: info.label)
                    
                    stopName.text = info.stop
                    
                    stopDescription.text = info.description
                }
                else{
                    let alert = UIAlertController(title: "Congrats!", message: "You've reached the end of the tour! Click browse all stops to view the map of Carnegie Mellon ", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                    alert.addAction(action)
                    presentViewController(alert, animated: true, completion: nil)
                }

            }
        }
        if tourStop?.stop == "Gesling"{
            tourStop = firstStop
            nextStop = tourStops.stops[1]
        }
        else {
            tourStop = nextStop
        }
        
        
    }
    

    
}









