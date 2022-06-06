use_frameworks!
inhibit_all_warnings!

platform :ios, '15.0'

# External

def external_pods
  # Formatter
  pod 'SwiftLint', '0.40.0'
  pod 'SwiftFormat/CLI', '0.48.11'
  
  # Constraints
  pod 'SnapKit', '~> 5.0.0'
  
  # Loader
  pod 'NVActivityIndicatorView'
  
  # Initialization
  pod 'Then', '~> 2.7'
  
  # Generate resources
  pod 'R.swift'
  
  # Cluster annotations
  pod 'Cluster'
end

# Developmet

def developmet_pods
  pod "UseCases", :path => "./Modules/UseCases"
  pod "Core", :path => "./Modules/Core"
  pod "Resources", :path => "./Modules/Resources"
  pod "Constants", :path => "./Modules/Constants"
  pod "UIComponents", :path => "./Modules/UIComponents"
  pod "Models", :path => "./Modules/Models"
  pod "Extensions", :path => "./Modules/Extensions"
  pod "App", :path => "./Modules/App"
end

# Targrts

target 'MapCluster' do
  external_pods
  developmet_pods
end
