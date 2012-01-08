Pod::Spec.new do |s|
  s.name     = 'OPFoundationKit'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  
  s.summary       = 'OPFoundationKit'
  s.homepage      = 'https://brandonwilliams.beanstalkapp.com/opfoundationkit'
  s.author        = { 'Brandon Williams' => 'brandon@opetopic.com' }
  s.source        = { :git => 'git@brandonwilliams.beanstalkapp.com:/opfoundationkit.git' }
  s.requires_arc  = true
  
  s.source_files = 'Source/**/*.{h,m}'
  
end