platform :ios, '8.0'
use_frameworks!

plugin 'cocoapods-keys'

pod 'Alamofire'
pod 'ObjectMapper'

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

