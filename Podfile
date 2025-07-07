# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
#source 'http://git.woa.com/T-CocoaPods/Specs.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '13.0'
install! 'cocoapods', :disable_input_output_paths => true

target 'customer_uikit_demo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  use_modular_headers!
    pod 'TencentCloudAIDeskCustomer', '1.0.14'
    pod 'TUIChat', '8.2.6325'
    pod 'TIMCommon', '8.2.6325'
    pod 'TUIConversation', '8.2.6325'
    pod 'TUIContact', '8.2.6325'
    pod 'TUIGroup', '8.2.6325'
    pod 'TUICore', '8.2.6325'
    pod 'TUISearch', '8.2.6325'
    pod 'TUITranslationPlugin', '8.2.6325'
    pod 'TUIConversationGroupPlugin', '8.2.6325'
    pod 'TUIConversationMarkPlugin', '8.2.6325'
    pod 'TUIVoiceToTextPlugin', '8.2.6325'
    pod 'TIMPush', '8.2.6325'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            #Fix Xcode14 Bundle target error
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
            config.build_settings['ENABLE_BITCODE'] = "NO"
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = "13.0"
            #Fix Xcode15 other links  flag  -ld64
            xcode_version = `xcrun xcodebuild -version | grep Xcode | cut -d' ' -f2`.to_f
            if xcode_version >= 15
              xcconfig_path = config.base_configuration_reference.real_path
              xcconfig = File.read(xcconfig_path)
              if xcconfig.include?("OTHER_LDFLAGS") == false
                xcconfig = xcconfig + "\n" + 'OTHER_LDFLAGS = $(inherited) "-ld64"'
              else
                if xcconfig.include?("OTHER_LDFLAGS = $(inherited)") == false
                  xcconfig = xcconfig.sub("OTHER_LDFLAGS", "OTHER_LDFLAGS = $(inherited)")
                end
                if xcconfig.include?("-ld64") == false
                  xcconfig = xcconfig.sub("OTHER_LDFLAGS = $(inherited)", 'OTHER_LDFLAGS = $(inherited) "-ld64"')
                end
              end
              File.open(xcconfig_path, "w") { |file| file << xcconfig }
            end
        end
        target.build_configurations.each do |config|
                  config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
                    '$(inherited)',
                    'PERMISSION_MICROPHONE=1',
                    'PERMISSION_CAMERA=1',
                    'PERMISSION_PHOTOS=1',
                  ]
                end
    end
end
