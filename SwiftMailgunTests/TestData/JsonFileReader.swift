//
//  JsonFileReader.swift
//  SwiftMailgun
//
//  Created by Chris Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation


/// Reads a file from path and retunrs the object representation
public class JSONFileReader {
    /**
     Reads a json from a file
     
     - parameter file: local file
     
     - returns: Object dic
     */
    class func JSON(fromFile file: String) -> AnyObject? {
        let path = NSBundle(forClass: self).pathForResource(file, ofType: "json")
        
        if path != nil {
            if let data = NSData(contentsOfFile: path!) {
                
                return try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
            }
        }
        
        return .None
    }
}