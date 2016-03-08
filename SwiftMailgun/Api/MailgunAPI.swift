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
        
        
        case sendEmail(String)
        
        var path: String {
            switch self{
            case .sendEmail(let domain):
                return "\(domain)/messages";
                
            }
        }
        
        private func urlStringWithApiKey(apiKey : String) -> URLStringConvertible{
            
            //Builds the url with the API key
            let urlWithKey = "https://api:\(apiKey)@\(Constants.mailgunApiURL)"
            //Build API URL
            var url = NSURL(string: urlWithKey)!
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
    
    
    /**
     Sends an email with the provided parameters
     
     - parameter to:                email to
     - parameter from:              email from
     - parameter subject:           subject of the email
     - parameter bodyHTML:          html body of the email, can be also plain text
     - parameter completionHandler: the completion handler
     */
    public func sendEmail(to to:String, from:String, subject:String, bodyHTML:String, completionHandler:(MailgunResult)-> Void) -> Void{
        
        let email = MailgunEmail(to: to, from: from, subject: subject, html: bodyHTML)
        
        self.sendEmail(email, completionHandler: completionHandler)
        
    }
    
    /**
     Send the email with the email object
     
     - parameter email:             email object
     - parameter completionHandler: completion handler
     */
    public func sendEmail(email: MailgunEmail, completionHandler:(MailgunResult)-> Void) -> Void{
        
        
        /// Serialize the object to an dictionary of [String:Anyobject]
        let params = Mapper().toJSON(email)
        
        
        //The mailgun API expect multipart params. 
        //Setups the multipart request
        Alamofire.upload(.POST, ApiRouter.sendEmail(self.domain).urlStringWithApiKey(self.apiKey), multipartFormData: { multipartFormData in
            
                // add parameters as multipart form data to the body
                for (key, value) in params {
                
                    multipartFormData.appendBodyPart(data: value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!, name: key)
                }
            
            },
            encodingCompletion: { encodingResult in
                switch encodingResult {
                //Check if it works
                case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        
                        //Check the response
                        switch response.result{
                            
                        case .Failure(let error):
                            
                            print("error calling \(ApiRouter.sendEmail)")
                            
                            let errorMessage = error.description
                            
                            if let data = response.data
                            {
                                let errorData = String(data: data, encoding: NSUTF8StringEncoding)
                                print(errorData)
                            }
                            
                            let result = MailgunResult(success: false, message: errorMessage, id: nil)
                            
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
                //Check if we fail
                case .Failure(let error):
                    
                    print("error calling \(ApiRouter.sendEmail)")
                    print(error)
                    
                    let errorMessage = "There was an error"
                    
                    let result = MailgunResult(success: false, message: errorMessage, id: nil)
                    
                    completionHandler(result)
                    return
                    
                }
            }
        )
        
    }
    
}

