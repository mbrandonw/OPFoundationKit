Pod::Spec.new do |s|
  s.name     = 'OPFoundationKit'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  
  s.summary       = 'OPFoundationKit'
  s.homepage      = 'https://github.com/mbrandonw/OPFoundationKit'
  s.author        = { 'Brandon Williams' => 'brandon@opetopic.com' }
  s.source        = { :git => 'git@github.com:mbrandonw/OPFoundationKit.git' }
  s.requires_arc  = true
  
  s.source_files = 'src/**/*.{h,m}'
  
end
