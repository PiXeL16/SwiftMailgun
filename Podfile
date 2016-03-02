platform :ios, '8.0'
use_frameworks!

plugin 'cocoapods-keys'

pod 'Alamofire', '~> 3.0'
pod 'ObjectMapper', '~> 1.1'

target 'SwiftMailgun' do

end

target 'SwiftMailgunTests' do
 
 pod 'Quick', '~> 0.8.0'
 pod 'Nimble', '~> 3.0.0'

plugin 'cocoapods-keys', {
  :project => "SwiftMailgun",
  :keys => [
    "Mailgun_Api_Key"  
]}

end

