//
//  TartanMapViewController.swift
//  TartanVirtualTour
//
//  Created by Jibby Ani on 12/6/15.
//  Copyright (c) 2015 Jibby Ani. All rights reserved.
//

import MapKit
import UIKit

enum MapType: Int {
    case Standard = 0
    case Hybrid
    case Satellite
}

class TartanMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
    
    let dataManager = DataManager()
    let location = Location()
    let tourStops = TourStops()
    var lastTappedCoordinates = CLLocationCoordinate2DMake(0,0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        location.getCurrentLocation()
        let initialLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        centerMapOnLocation(initialLocation)
        //  loop through stops and drop pin 
        for var i = 0; i < tourStops.stops.count; ++i {
            let td = tourStops.stops[i]
          let dropPin = MKPointAnnotation()
            dropPin.coordinate = CLLocationCoordinate2DMake(td.xcoordinate, td.ycoordinate)
            dropPin.title = td.stop
            dropPin.subtitle = td.subtitle
            mapView.addAnnotation(dropPin)
            
            
        }
        
        mapView.delegate = self
        
        let alert = UIAlertController(title: "Welcome to Campus!", message: dataManager.generateMessage(), preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)

    }
    
    let regionRadius: CLLocationDistance = 400
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func mapTypeChanged(sender: AnyObject) {
        let mapType = MapType(rawValue: mapTypeSegmentedControl.selectedSegmentIndex)
        switch (mapType!) {
        case .Standard:
            mapView.mapType = MKMapType.Standard
        case .Hybrid:
            mapView.mapType = MKMapType.Hybrid
        case .Satellite:
            mapView.mapType = MKMapType.Satellite
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "directions" {
            let tourStop = findTourStopFor(lastTappedCoordinates)
            let detailsVC:TourStopInfoViewController = segue.destinationViewController as! TourStopInfoViewController
            detailsVC.tourStop = tourStop
        }
    }
    
    
}
