//
//  MailgunApiSpecs.swift
//  SwiftMailgun
//
//  Created by Chris Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation

import Nimble
import Quick
import ObjectMapper
import Keys
@testable import SwiftMailgun

class MailgunApiSpecs: QuickSpec{
    
    
    override func spec() {
        
        let timeout: TimeInterval = 10
        
        it("send email without api valid api key"){
            
            let mailgun = MailgunAPI(apiKey: "123123", clientDomain: "sandboxbe44cd7651a44ddb85c646f747d94d7d.mailgun.org")
            
            var result : MailgunResult? = nil
            
            mailgun.sendEmail(to: "cjimenez16@gmail.com", from: "Excited User <mailgun@test.com>", subject: "This is a test", bodyHTML: "<b>test<b>") { mailgunResult in
                
                result = mailgunResult
                
            }
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result?.hasError).toEventually(beTruthy(),timeout:timeout)
            expect(result?.message).toEventuallyNot(beNil(), timeout:timeout)
            
        }
        
        it("send email with valid api key"){
            
            let keys = SwiftMailgunKeys()
            
            let mailgun = MailgunAPI(apiKey: keys.mailgun_Api_Key, clientDomain: "sandboxbe44cd7651a44ddb85c646f747d94d7d.mailgun.org")
            
            var result : MailgunResult? = nil
            
            mailgun.sendEmail(to: "cjimenez16@gmail.com", from: "<Send To Me> mailgun@test.com", subject: "This is a test", bodyHTML: "<b>test<b>") { mailgunResult in
                
                result = mailgunResult
                
            }
            
            expect(result).toEventuallyNot(beNil(),timeout:timeout)
            expect(result?.hasError).toEventually(beFalsy(),timeout:timeout)
            expect(result?.message).toEventuallyNot(beNil(), timeout:timeout)
            
        }
        
    }

}

