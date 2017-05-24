Pod::Spec.new do |s|

  s.name         = "SQITools"
  s.version      = "1.0.1"
  s.summary      = "Shane's essential tools for iOS developing."
  s.description  = <<-DESC
    Shane's essential tools for iOS developing.
	Containing:
		- StoryboardInstantiatable
		- Identifiable
                   DESC
  s.homepage     = "https://github.com/ShaneQi/SQITools"
  s.license      = "MIT"
  s.author       = { "Shane Qi" => "qizengtai@gmail.com" }
  s.source       = { :git => "https://github.com/ShaneQi/SQITools.git", :tag => "#{s.version}" }
  s.source_files  = "Sources"
  s.ios.deployment_target = "8.0"
  s.dependency "Cooking"

end
