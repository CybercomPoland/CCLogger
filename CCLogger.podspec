Pod::Spec.new do |s|
  s.name         = "CCLogger"
  s.version      = "0.0.4"
  s.summary      = "Swift logging library"
  s.homepage     = "https://github.com/CybercomPoland/CCLogger"
  s.license      = 'Apache License, Version 2.0'
  s.author       = {'Andrzej Jacak' => 'http://cybercom.com',}
  s.source       = { :git => 'https://github.com/CybercomPoland/CCLogger.git',  :branch => "main"}
  s.social_media_url = ''
  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.source_files = 'CCLogger/*.swift'
  s.swift_version = '5.0'
end