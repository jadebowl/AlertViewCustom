Pod::Spec.new do |s|
  s.name             = 'AlertViewCustom'
  s.version          = '3.0.1'
  s.summary          = 'Create a custom UIAlertView to fit the style of your app'

  s.description      = <<-DESC
  With AlertViewCustom you can create your own customised UIAlertView instead of using the default one from Apple, which doesn't always fit in with the style of your app.
                       DESC

  s.homepage         = 'https://github.com/jadebowl/AlertViewCustom'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Giada Ciotola' => 'giadaciotola@hotmail.it' }
  s.source           = { :git => 'https://github.com/jadebowl/AlertViewCustom.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.source_files = 'Sources/**/*'
  s.frameworks = 'UIKit'
  
  s.swift_version = '5.0'
  
end