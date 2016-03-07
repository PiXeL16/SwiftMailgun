//
//  MailgunResult.swift
//  SwiftMailgun
//
//  Created by Christopher Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import ObjectMapper


public class MailgunResult: Mappable{
    
    public var success: Bool = false
    public var message: String?
    public var id: String?
    
    public var hasError : Bool{
        return !success
    }
    
    public init(){}
    
    
    public convenience init(success:Bool, message:String, id:String?){
        
        self.init()
        self.success = success
        self.message = message
        self.id = id
        
    }

    public required init?(_ map: Map) {}
    
    public func mapping(map: Map) {
        message  <- map["message"]
        id       <- map["id"]
    }
    
    
    
    
}