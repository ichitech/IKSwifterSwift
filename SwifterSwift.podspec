Pod::Spec.new do |s|
  s.name = 'IKSwifterSwift'
  s.version = '1.0.1'
  s.summary = 'A handy collection of more than 500 native Swift extensions to boost your productivity.'
  s.description = ''

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

  # SwiftStdlib Extensions
  s.subspec 'SwiftStdlib' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/SwiftStdlib/*.swift'
  end

  # Foundation Extensions
  s.subspec 'Foundation' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/Foundation/*.swift'
  end

  # UIKit Extensions
  s.subspec 'UIKit' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/UIKit/*.swift'
  end

  # AppKit Extensions
  s.subspec 'AppKit' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/AppKit/*.swift'
  end

  # CoreGraphics Extensions
  s.subspec 'CoreGraphics' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/CoreGraphics/*.swift'
  end

  # CoreLocation Extensions
  s.subspec 'CoreLocation' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/CoreLocation/*.swift'
  end

  # CoreAnimation Extensions
  s.subspec 'CoreAnimation' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/CoreAnimation/*.swift'
  end

  # MapKit Extensions
  s.subspec 'MapKit' do |sp|
    sp.source_files  = 'Sources/SwifterSwift/MapKit/*.swift'
  end

  # SpriteKit Extensions
  s.subspec 'SpriteKit' do |sp|
    sp.source_files = 'Sources/SwifterSwift/SpriteKit/*.swift'
  end

  s.subspec 'SceneKit' do |sp|
    sp.source_files = 'Sources/SwifterSwift/SceneKit/*.swift'
  end

  # StoreKit Extensions
  s.subspec 'StoreKit' do |sp|
    sp.source_files = 'Sources/SwifterSwift/StoreKit/*.swift'
  end

  # Dispatch Extensions
  s.subspec 'Dispatch' do |sp|
    sp.source_files = 'Sources/SwifterSwift/Dispatch/*.swift'
  end

  # WebKit Extensions
  s.subspec 'WebKit' do |sp|
    sp.source_files = 'Sources/SwifterSwift/WebKit/*.swift'
  end

  # HealthKit Extensions
  s.subspec 'HealthKit' do |sp|
    sp.source_files = 'Sources/SwifterSwift/HealthKit/*.swift'
  end

end
