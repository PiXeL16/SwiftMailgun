//
//  MailgunEmail.swift
//  SwiftMailgun
//
//  Created by Christopher Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import ObjectMapper


public class MailgunEmail : Mappable{
    
    public var from     :String?
    public var to       :String?
    public var subject  :String?
    public var html     :String?
    public var text     :String?
    
    
    public required init?(_ map: Map) {}
    
    public init(){}
    
    public convenience init(to:String, from:String, subject:String, html:String){
        
        self.init()
        
        self.to = to
        self.from = from
        self.subject = subject
        self.html = html
        self.text = html.htmlToString
    
    }
    
    /**
     Mapping functionality for serialization/deserialization
     
     - parameter map: <#map description#>
     */
    public func mapping(map: Map){
        to       <- map["to"]
        from     <- map["from"]
        subject  <- map["subject"]
        html     <- map["html"]
        text     <- map["text"]
    }

    
}
