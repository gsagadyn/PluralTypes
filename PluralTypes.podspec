Pod::Spec.new do |s|
  s.name             = 'PluralTypes'
  s.version          = '0.1.0'
  s.summary          = 'Resolves plural type for a specified quantity.'
  s.homepage         = 'https://github.com/gsagadyn/PluralTypes'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Grzegorz Sagadyn' => 'sagadyn@gmail.com' }
  s.source           = { :git => 'https://github.com/gsagadyn/PluralTypes.git', :tag => s.version.to_s }

  s.swift_version = "5.1"
  s.ios.deployment_target = '10.3'
  s.frameworks = 'Foundation'
  s.requires_arc = true
  s.source_files = 'PluralTypes/Classes/**/*.{swift}'
  s.resources = 'PluralTypes/Assets/**/*.{stringsdict}'
end
