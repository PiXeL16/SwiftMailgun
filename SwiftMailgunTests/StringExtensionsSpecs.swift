//
//  StringExtensionsSpecs.swift
//  SwiftMailgun
//
//  Created by Chris Jimenez on 3/8/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation


import Nimble
import Quick
import SwiftMailgun

public class StringExtensionsSpecs: QuickSpec{
    
    override public func spec() {
        
        it("htmlToString valid"){
            
           let html:String = "<b>bold html</b>"
            
           expect(html.htmlToString).toNot(beNil())
           expect(html.htmlToString).to(equal("bold html"))
            
        }
        
    }
    
    
    
    
}
