# SwiftMailgun
[![Build Status](https://travis-ci.org/PiXeL16/SwiftMailgun.svg?branch=master)](https://travis-ci.org/PiXeL16/SwiftMailgun/) [![codecov.io](https://codecov.io/github/PiXeL16/SwiftMailgun/coverage.svg?branch=master)](https://codecov.io/github/PiXeL16/SwiftMailgun?branch=master) [![Cocoapods Compatible](https://img.shields.io/cocoapods/v/SwiftMailgun.svg)](https://img.shields.io/cocoapods/v/SwiftMailgun.svg) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PiXeL16/SwiftMailgun/master/LICENSE)
[![Swift 3](https://img.shields.io/badge/language-Swift%203.0-orange.svg)](https://swift.org)

SwiftMailgun provides simple alternative when you need to send an email with your iOS app using MailGun.

:question: Why?
----
Sometimes, there is the need to setup a simple email form in your iOS app, or trigger an email after an action,  without having to setup your own service for that, sometimes you don't want to use the `MailComposeViewController` or use a `SMTP` library.
This provide a simple alternative when you need to send an email with your iOS app.

:email: Mailgun
----
[Mailgun](https://mailgun.com) provides a simple  reliable API for transactional emails. You will need to have a `ApiKey` and account account to use the client.

:octocat: Installation
----
Get `SwiftMailgun` on CocoaPods, just add `pod 'SwiftMailgun'` to your Podfile.

:mortar_board: Usage
-----
Usage is very simple

```swift

import SwiftMailgun

let mailgun = MailgunAPI(apiKey: "YouAPIKey", clientDomain: "yourDomain.com")

mailgun.sendEmail(to: "to@test.com", from: "Test User <test@test.com>", subject: "This is a test", bodyHTML: "<b>test<b>") { mailgunResult in

  if mailgunResult.success{
    print("Email was sent")
  }

}

```

:wrench: TODO
-----
* Multiple recipients
* Add attachments
* Add other API settings like tracking, tags, etc
* Carthage support

:v: License
-------
MIT

:alien: Author
------
Chris Jimenez - http://chrisjimenez.net, [@chrisjimeneznat](http://twitter.com/chrisjimeneznat)
