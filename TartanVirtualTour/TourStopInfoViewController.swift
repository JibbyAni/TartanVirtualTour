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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // we need to safely unpack the info tab and display the data
        if let info = tourStop {
            
            
            stopImage.image = UIImage(named: info.label)
            
            stopName.text = info.stop
            println(info)
            println(tourStops.stops[0])
            
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

   

    
}









