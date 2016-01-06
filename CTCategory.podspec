Pod::Spec.new do |s|
  s.name         = "CTCategory"
  s.version      = "0.0.1"
  s.summary      = "框架使用的核心类扩展"
  s.description  = <<-DESC
框架使用的核心类扩展
                   DESC
  s.homepage     = "https://github.com/Evan-CT/CTCoreCategory"
  s.license      = "MIT"
  s.author       = { "Evan.Cheng" => "Evan_Tong@163.com" }
  s.source       = { :git => "https://github.com/Evan-CT/CTCoreCategory.git", :tag => "0.0.1" }

  s.source_files  = "CTCategory", "CTCategory/**/*.{h,m}"

end
