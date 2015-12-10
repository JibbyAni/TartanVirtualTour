//
//  MapVCExtension.swift
//  TartanVirtualTour
//
//  Created by Jibby Ani on 12/8/15.
//  Copyright (c) 2015 Jibby Ani. All rights reserved.
//

import MapKit
import UIKit

extension TartanMapViewController: MKMapViewDelegate {
    
    

    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if let annotation = annotation  {
           
            var currLoc = Location()
            currLoc.getCurrentLocation()

            if annotation.coordinate.latitude != currLoc.latitude && annotation.coordinate.longitude != currLoc.longitude {

            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView {
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            return view
            }
        }
        return nil
    }
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!,
        calloutAccessoryControlTapped control: UIControl!) {
            if control == view.rightCalloutAccessoryView {
                lastTappedCoordinates = CLLocationCoordinate2DMake(view.annotation.coordinate.latitude, view.annotation.coordinate.longitude)
                performSegueWithIdentifier("directions", sender: self)
                
            }
    }
    

    func findTourStopFor(coordinates: CLLocationCoordinate2D)-> TourStop{
        var ts: [TourStop] = []
        for var i = 0; i < tourStops.stops.count; ++i {
            if coordinates.latitude == tourStops.stops[i].xcoordinate && coordinates.longitude == tourStops.stops[i].ycoordinate{
                ts.append(tourStops.stops[i])
            }
        }
        return ts[0]
    }
    
}


