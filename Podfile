# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'DTCab' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DTCab

pod 'SDWebImage'
  pod 'IQKeyboardManagerSwift'
  pod 'JTMaterialSpinner', '~> 3.0'
  pod 'GoogleMaps'
  pod 'GooglePlaces'
  pod 'Firebase/Core’
  pod 'Firebase/Messaging'
  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
  pod 'SideMenu' 
 
  pod 'Alamofire', '~> 4.4'

  target 'DTCabTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DTCabUITests' do
    # Pods for testing
  end

end

post_install do |installer|
      installer.pods_project.build_configurations.each do |config|
        config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      end
end
