Pod::Spec.new do |s|

  s.name         = "SwiftMailgun"
  s.version      = "1.0.2"
  s.summary      = "A simple iOS client for the Mandrill Mail API"
  s.description  = <<-DESC
SwiftMandrill provides simple alternative when you need to send an email with your iOS app.
    DESC

  s.homepage     = "https://github.com/PiXeL16/SwiftMandrill"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Chris Jimenez" => "cjimenez16@gmail.com" }
  s.social_media_url   = "http://twitter.com/chrisjimeneznat"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/PiXeL16/SwiftMandrill.git", :tag => s.version }
  s.source_files  = "SwiftMandrill/", "SwiftMandrill/**/*.{h,m,swift}"

  s.requires_arc = true
  s.dependency 'ObjectMapper', '~> 1.1'
  s.dependency 'Alamofire', '~> 3.0'

end
