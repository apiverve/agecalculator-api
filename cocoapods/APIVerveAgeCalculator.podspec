Pod::Spec.new do |s|
  s.name             = 'APIVerveAgeCalculator'
  s.version          = '1.2.3'
  s.summary          = 'Age Calculator converts a date of birth into exact age broken down by years, months, weeks, days, hours, minutes, and seconds.'
  s.description      = <<-'DESC'
Age Calculator converts a date of birth into exact age broken down by years, months, weeks, days, hours, minutes, and seconds. It also provides the age in written words and a countdown to the next birthday.

This iOS/macOS SDK provides a convenient way to access the Age Calculator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/agecalculator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/agecalculator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveAgeCalculator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
