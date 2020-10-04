# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

plugin 'cocoapods-keys', {
  :project => "PostsApp",
  :keys => [
    "AppIDSecret",
  ]}

target 'PostsApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PostsApp
  pod 'RxSwift', '~> 5'
  pod 'Swinject'
  pod 'Kingfisher', '~> 5.0'
  pod 'TagListView', '~> 1.0'
  pod 'SwiftGen', '~> 6.0'

  target 'PostsAppTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking', '~> 5'
    pod 'RxTest', '~> 5'
    pod "Cuckoo"
  end

  target 'PostsAppUITests' do
    # Pods for testing
  end

end
