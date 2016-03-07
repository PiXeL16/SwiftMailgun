//
//  MailgunAPI.swift
//  SwiftMailgun
//
//  Created by Christopher Jimenez on 3/7/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

//
//  MandrillAPI.swift
//  SwiftMandrill
//
//  Created by Christopher Jimenez on 1/18/16.
//  Copyright © 2016 greenpixels. All rights reserved.
//

import Alamofire
import ObjectMapper

/// Mailgun API Class to be use to send emails
public class MailgunAPI {
    
    private let apiKey : String
    private let domain : String
    
    
    //ApiRouter enum that will take care of the routing of the urls and paths of the API
    private enum ApiRouter {
        
        static let baseURL = Constants.mailgunApiURL;
        
        case sendEmail
        
        var path: String {
            switch self{
            case .sendEmail:
                return "/messages/";
                
            }
        }
        
        private func urlStringWithDomain(domain:String) -> URLStringConvertible{
            
            //Build API URL
            var url = NSURL(string: ApiRouter.baseURL)!
            //TODO: Fix this to a one line call
            url = url.URLByAppendingPathComponent(domain)
            url = url.URLByAppendingPathComponent(path)
            
            let urlRequest = NSMutableURLRequest(URL: url)
            
            return urlRequest.URLString;
            
        }
        
    }
    
    /**
     Inits the API with the ApiKey and client domain
     
     - parameter apiKey:       Api key to use the API
     - parameter clientDomain: Client domain authorized to send your emails
     
     - returns: MailGun API Object
     */
    public init(apiKey:String, clientDomain:String)
    {
        self.apiKey = apiKey
        self.domain = clientDomain
        
    }
    
    
    public func sendEmail(to to:String, from:String, subject:String, bodyHTML:String, completionHandler:(MailgunResult)-> Void) -> Void{
        
        let email = MailgunEmail(to: to, from: from, subject: subject, html: bodyHTML)
        
        self.sendEmail(email, completionHandler: completionHandler)
        
    }
    
    public func sendEmail(email: MailgunEmail, completionHandler:(MailgunResult)-> Void) -> Void{
        
        
        let headerParams : [String:String] = [
            "api":self.apiKey
        ]
        
        let params = Mapper().toJSON(email)
        
        Alamofire.request(.POST, ApiRouter.sendEmail.urlStringWithDomain(self.domain), parameters: params, encoding: .JSON, headers: headerParams)
            .validate()
            .responseJSON{ response in
                
                switch response.result
                {
                    
                case .Failure(let error):
                    
                    print("error calling \(ApiRouter.sendEmail)")
                    
                    var errorMessage = error.description
                    
                    if let data = response.data
                    {
                        
                        //                        if let errorResult: MandrillError = ObjectParser.objectFromJsonString(String(data: data, encoding: NSUTF8StringEncoding))
                        //                        {
                        //                            errorMessage = errorResult.message!
                        //                        }
                    }
                    
                    let result = MailgunResult(success: false, message: "Error", id: nil)
                    
                    completionHandler(result)
                    return
                    
                case .Success:
                    
                    if let value: AnyObject = response.result.value {
                        
                        let result:MailgunResult = ObjectParser.objectFromJson(value)!
                        
                        result.success = true
                        
                        completionHandler(result)
                        
                        return
                        
                        
                    }
                    
                }
        }
        
        
    }
    
}

