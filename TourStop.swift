//
//  TourStop.swift
//  TartanVirtualTour
//
//  Created by Jibby Ani on 12/6/15.
//  Copyright (c) 2015 Jibby Ani. All rights reserved.
//

import Foundation
import MapKit
import AddressBook



class TourStop{
    let stop: String
    let subtitle: String
    let description: String
    let label: String
    let xcoordinate: Double
    let ycoordinate: Double
    
    
    init(tstop: String, subt: String, desc: String, lab: String, xcoord: Double, ycoord: Double){
        stop = tstop
        subtitle = subt
        description = desc
        label = lab
        xcoordinate = xcoord
        ycoordinate = ycoord
    }
    
    // annotation callout info button opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(kABPersonAddressStreetKey): description]
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: xcoordinate, longitude: ycoordinate), addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = stop
        
        return mapItem
    }

}