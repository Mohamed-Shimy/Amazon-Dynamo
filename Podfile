platform :ios, '16.1'

use_frameworks!
inhibit_all_warnings!
deployment_target = '16.1'
swift_version = '5.0'

target 'AmazonDynamo' do

  # Pods for AmazonDynamo
  pod 'Moya/Combine'
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        config.build_settings['SWIFT_VERSION'] = swift_version
      end
    end
    project.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
      config.build_settings['SWIFT_VERSION'] = swift_version
    end
  end
end
