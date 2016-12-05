//
//  MailgunResult.swift
//  SwiftMailgun
//
//  Created by Christopher Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import ObjectMapper


open class MailgunResult: Mappable{
    
    open var success: Bool = false
    open var message: String?
    open var id: String?
    
    open var hasError : Bool{
        return !success
    }
    
    public init(){}
    
    
    public convenience init(success:Bool, message:String, id:String?){
        
        self.init()
        self.success = success
        self.message = message
        self.id = id
        
    }

    public required init?(map: Map) {}
    
    open func mapping(map: Map) {
        message  <- map["message"]
        id       <- map["id"]
    }
    
    
    
    
}
