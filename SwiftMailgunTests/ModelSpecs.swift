//
//  ModelSpecs.swift
//  SwiftMailgun
//
//  Created by Chris Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

import Nimble
import Quick
import SwiftMailgun
import ObjectMapper
import Keys


/// Model specs using fake data.
class TestDataModelSpecs: QuickSpec{
    override func spec() {
        
        let toEmail = "cjimenez16@gmail.com"
        
        it("Decode email result"){
            
            let emailResult: MailgunResult? = ObjectParser.objectFromJson(JSONFileReader.JSON(fromFile: "mailgun_result"))
            
            expect(emailResult).toNot(beNil())
            expect(emailResult?.message).toNot(beNil())
            expect(emailResult?.id).toNot(beNil())
            
        }
        
        
        it("Decode email"){
            
            let emailObject: MailgunEmail? = ObjectParser.objectFromJson(JSONFileReader.JSON(fromFile: "mailgun_email"))
            
            expect(emailObject).toNot(beNil())
            expect(emailObject!.from).toNot(beNil())
            expect(emailObject?.to).toNot(beNil())
            expect(emailObject?.to).to(equal(toEmail))
            
            
        }
        
    }
}