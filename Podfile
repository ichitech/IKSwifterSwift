# Source 'https://github.com/CocoaPods/Specs.git'
# Uncomment the next line to define a global platform for your project

use_frameworks!
inhibit_all_warnings!
platform :ios, '10.0'

workspace 'SwifterSwift'
project 'SwifterSwift.xcodeproj'

def import_pods
    pod 'SwifterSwift'
    pod 'Alamofire'
    pod 'SwiftSpinner'
    pod 'MBProgressHUD'
    pod 'Firebase/Crashlytics'
    pod 'Firebase/Analytics'
    pod 'Firebase/Core'
end

target 'SwifterSwift-iOS'  do
    import_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'YES'
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = 'YES'
            config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
            config.build_settings['SWIFT_SUPPRESS_WARNINGS'] = 'YES'
            config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
        end
    end
end
