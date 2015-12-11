//
//  DataManager.swift
//  TartanVirtualTour
//
//  Created by Jibby Ani on 12/6/15.
//  Copyright (c) 2015 Jibby Ani. All rights reserved.
//

import Foundation

class DataManager {
    
    var location = Location()
    
    init() {
        loadLocations()
        println("Documents folder is \(documentsDirectory())\n")
        println("Data file path is \(dataFilePath())")
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as! [String]
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return documentsDirectory().stringByAppendingPathComponent("Locations.plist")
    }
    
    func saveLocations() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(location, forKey: "Locations")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadLocations() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                self.location = unarchiver.decodeObjectForKey("Locations") as! Location
                unarchiver.finishDecoding()
            }
        }
    }
    
    func generateMessage() -> String {
        let message = "Click ok to see the map, then click on any pin to browse each stop on the tour"
        return message
    }
}
