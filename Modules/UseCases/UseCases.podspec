Pod::Spec.new do |spec|
  spec.name         = "UseCases"
  spec.version      = "0.0.1"
  spec.summary      = "UseCases"
  spec.description  = <<-DESC
  Extensions module
                   DESC
  spec.homepage     = "https://test.by"
  spec.license      = "BSD"
  spec.author       = { "Raman Harhun" => "r.harhun@gmail.com" }
  spec.platform     = :ios, "15.0"
  spec.swift_version = "5.0"
  spec.source       = { :path => "." }
  spec.source_files  = "UseCases/**/*.{h,m,swift}"
  
  spec.frameworks = "Foundation"
  
  spec.dependency "Models"
  spec.dependency "Core"
end

