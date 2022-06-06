Pod::Spec.new do |spec|
  spec.name         = "App"
  spec.version      = "0.0.1"
  spec.summary      = "Constants"
  spec.description  = <<-DESC
  Extensions module
  DESC
  spec.homepage     = "https://test.by"
  spec.license      = "BSD"
  spec.author       = { "Raman Harhun" => "r.harhun@gmail.com" }
  spec.platform     = :ios, "15.0"
  spec.swift_version = "5.0"
  spec.source       = { :path => "." }
  spec.source_files  = "App/**/*.{h,m,swift}"
  spec.static_framework = true

  spec.frameworks = "Foundation"
  
  spec.dependency "Core"
  spec.dependency "UseCases"
  spec.dependency "Cluster"
end
