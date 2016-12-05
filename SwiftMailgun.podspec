Pod::Spec.new do |s|

  s.name         = "SwiftMailgun"
  s.version      = "1.0.0"
  s.summary      = "A simple alternative when you need to send an email with your iOS app using MailGun."
  s.description  = <<-DESC
SwiftMailgun provides simple alternative when you need to send an email with your iOS app using MailGun.
    DESC

  s.homepage     = "https://github.com/PiXeL16/SwiftMailgun"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Chris Jimenez" => "cjimenez16@gmail.com" }
  s.social_media_url   = "http://twitter.com/chrisjimeneznat"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/PiXeL16/SwiftMailgun.git", :tag => s.version }
  s.source_files  = "SwiftMailgun/", "SwiftMailgun/**/*.{h,m,swift}"

  s.requires_arc = true
  s.dependency 'ObjectMapper', '~> 2.2.1'
  s.dependency 'Alamofire', '~> 4.2.0'

end
