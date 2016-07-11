Pod::Spec.new do |s|
  s.name         = "CTCoreCategory"
  s.version      = "0.0.1"
  s.summary      = "UIView的扩展"
  s.description  = <<-DESC
                     一个UIView的扩展
                   DESC
  s.homepage     = "https://github.com/Excalibur-CT/CTCoreCategory"
  s.license      = 'MIT'
  s.author       = { "Evan.Cheng" => "Evan_Tong@163.com" }
  s.source       = { :git => "https://github.com/Excalibur-CT/CTCoreCategory.git", :tag =>  s.version }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.public_header_files = 'CTCoreCategory/CTCoreCategory.h'
  s.source_files = 'CTCoreCategory/CTCoreCategory.h'

  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit', 'Accelerate'

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

  s.subspec 'NSString' do |ss|
    ss.source_files = 'CTCoreCategory/**/NS{DataAES,String+Extend,String+Password,String+PJR}.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/NS{DataAES,String+Extend,String+Password,String+PJR}.h'
  end

  s.subspec 'UIAlertView' do |ss|
    ss.source_files = 'CTCoreCategory/**/UIAlertView+Additional.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/UIAlertView+Additional.h'
  end

  s.subspec 'UIController' do |ss|
    ss.source_files = 'CTCoreCategory/**/UIViewController+Extend.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/UIViewController+Extend.h'
  end

  s.subspec 'UINavigationController' do |ss|
    ss.source_files = 'CTCoreCategory/**/UINavigationController+FDFullscreenPopGesture.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/UINavigationController+FDFullscreenPopGesture.h'
  end

  s.subspec 'UIImage' do |ss|
    ss.source_files = 'CTCoreCategory/**/UIImage+{Color,Cut,Extend,FixOrientation,Water,Effect}.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/UIImage+{Color,Cut,Extend,FixOrientation,Water,Effect}.h'
  end

   s.subspec 'UITableViewCell' do |ss|
    ss.source_files = 'CTCoreCategory/**/UITableViewCell+Extend.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/UITableViewCell+Extend.h'
  end

  s.subspec 'UIView' do |ss|
    ss.source_files = 'CTCoreCategory/**/UIView+Extend.{h,m}'
    ss.public_header_files = 'CTCoreCategory/**/UIView+Extend.h'
  end
end
