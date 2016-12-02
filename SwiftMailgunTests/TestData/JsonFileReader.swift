//
//  JsonFileReader.swift
//  SwiftMailgun
//
//  Created by Chris Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation


/// Reads a file from path and retunrs the object representation
open class JSONFileReader {
    /**
     Reads a json from a file
     
     - parameter file: local file
     
     - returns: Object dic
     */
    class func JSON(fromFile file: String) -> AnyObject? {
        let path = Bundle(for: self).path(forResource: file, ofType: "json")
        
        if path != nil {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path!)) {
                
                return try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0)) as AnyObject?
            }
        }
        
        return .none
    }
}
