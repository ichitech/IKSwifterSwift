Pod::Spec.new do |s|
  s.name = 'IKSwifterSwift'
  s.version = '1.0.1'
  s.summary = 'A handy collection of more than 500 native Swift extensions to boost your productivity.'
  s.description = 'A handy collection of more than 500 native Swift extensions to boost your productivity'

  s.homepage = 'https://github.com/SwifterSwift/SwifterSwift'
  s.license = { type: 'MIT', file: 'LICENSE' }
  s.authors = { 'IchiTech' => 'ichitech89@gmail.com' }
  s.social_media_url = 'https://github.com/ichitech'
  s.screenshot = 'https://raw.githubusercontent.com/SwifterSwift/SwifterSwift/master/Assets/logo.png'

  s.ios.deployment_target = '10.0'
  #s.osx.deployment_target = '10.10'
  #s.tvos.deployment_target = '9.0'
  #s.watchos.deployment_target = '2.0'

  s.swift_version = '5.3'
  s.requires_arc = true
  s.source = { git: 'https://github.com/ichitech/IKSwifterSwift.git', tag: s.version.to_s }
  s.source_files = 'Sources/SwifterSwift/**/*.swift'

  # SwiftStdlib Extensions
  s.subspec 'Protocols' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/Protocols/*.swift'
  end

  # Foundation Extensions
  s.subspec 'Foundation' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/Foundation/*.swift'
  end

  # UIKit Extensions
  s.subspec 'UIKit' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/UIKit/*.swift'
  end

end
