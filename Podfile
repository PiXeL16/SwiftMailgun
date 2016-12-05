platform :ios, '8.0'
use_frameworks!

plugin 'cocoapods-keys'

pod 'Alamofire', '~> 4.2.0'
pod 'ObjectMapper', '~> 2.2.1'

target 'SwiftMailgun' do

end

target 'SwiftMailgunTests' do
 
 pod 'Quick'
 pod 'Nimble'

plugin 'cocoapods-keys', {
  :project => "SwiftMailgun",
  :keys => [
    "Mailgun_Api_Key"  
]}

end

