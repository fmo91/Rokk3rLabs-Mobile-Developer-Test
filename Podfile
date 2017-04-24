# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Rokk3rLabsTest' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Pods for Rokk3rLabsTest
    pod 'RxSwift',    '3.0.1'
    pod 'RxCocoa',    '3.0.1'
    pod 'ObjectMapper', '2.2.2'

    # Easily register and dequeue cells without using strings
    # https://fmo91.github.io/DequeuableRegistrable/
    pod 'DequeuableRegistrable', '0.1.5'

    target 'Rokk3rLabsTestTests' do
        inherit! :search_paths
        # Pods for testing
    end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end