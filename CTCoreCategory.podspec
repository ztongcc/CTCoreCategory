Pod::Spec.new do |s|
  s.name         = "CTCoreCategory"
  s.version      = "0.0.1"
  s.summary      = "UIView的扩展"
  s.description  = <<-DESC
                     一个UIView的扩展
                   DESC
  s.homepage     = "https://github.com/Evan-CT/CTCoreCategory"
  s.license      = 'MIT'
  s.author       = { "Evan.Cheng" => "Evan_Tong@163.com" }
  s.source       = { :git => "https://github.com/Evan-CT/CTCoreCategory.git", :tag =>  s.version }

  s.platform     = :ios, '4.3'
  s.requires_arc = true

  s.public_header_files = 'CTCoreCategory/Category.h'
  s.source_files = 'CTCoreCategory/Category.h'

  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'

  s.subspec 'NSArray' do |ss|
    ss.source_files = 'CTCoreCategory/**/NSArray+Extend.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/NSArray+Extend.h'
  end

  s.subspec 'NSDate' do |ss|
    ss.source_files = 'CTCoreCategory/**/NSDate+{AdditionalExtend,Extend}.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/NSDate+{AdditionalExtend,Extend}.h'
  end

  s.subspec 'NSDictionary' do |ss|
    ss.source_files = 'CTCoreCategory/**/NSMutableDictionary+BBExtensions.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/NSMutableDictionary+BBExtensions.h'
  end

  s.subspec 'NSObject' do |ss|
    ss.source_files = 'CTCoreCategory/**/NSObject+property.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/NSObject+property.h'
  end
end
