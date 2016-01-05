Pod::Spec.new do |s|
  s.name         = "CTCategory"
  s.version      = "0.0.1"
  s.summary      = “框架使用的核心类扩展”

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC 
                   DESC

  s.homepage     = "https://github.com/Evan-CT/CTCoreCategory"

  s.license      = "MIT"

  s.author             = { "admin" => "Evan_Tong@163.com" }
  s.source       = { :git => "https://github.com/Evan-CT/CTCoreCategory.git", :tag => "0.0.1" }

  s.source_files  = "CTCategory", "CTCategory/**/*.{h,m}"
  s.exclude_files = "CTCategory/Exclude"

end
