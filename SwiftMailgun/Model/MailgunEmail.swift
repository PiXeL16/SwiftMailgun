//
//  MailgunEmail.swift
//  SwiftMailgun
//
//  Created by Christopher Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import ObjectMapper


open class MailgunEmail : Mappable{
    
    open var from     :String?
    open var to       :String?
    open var subject  :String?
    open var html     :String?
    open var text     :String?
    
    
    public required init?(map: Map) {}
    
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
    open func mapping(map: Map){
        to       <- map["to"]
        from     <- map["from"]
        subject  <- map["subject"]
        html     <- map["html"]
        text     <- map["text"]
    }

    
}
