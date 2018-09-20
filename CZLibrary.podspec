
Pod::Spec.new do |s|

  s.name         = "CZLibrary"
  s.version      = "0.0.11"
  s.summary      = "cz self library summary"
  s.description  = "cz self library description"
  s.homepage     = "https://github.com/JuYiWei/CZLibrary"
  s.license      = "MIT"
  s.author       = { "juyw" => "757832801@qq.com" }
  s.platform     = :ios, "9.0"

# 资源
  s.source       = { :git => "https://github.com/JuYiWei/CZLibrary.git", :tag => "#{s.version}" }

  s.source_files  = "CZLibrary/CZLibrary/Lbirary/*.{h,m}"
  # s.subspec 'Category' do |ss1|
  #   ss1.subspec 'UIKit' do |sss11|
  #     sss11.source_files  = "CZLibrary/CZLibrary/Lbirary/Category/UIKit/*.{h,m}"
  #   end
  #   ss1.subspec 'Foundation' do |sss12|
  #     sss12.source_files  = "CZLibrary/CZLibrary/Lbirary/Category/Foundation/*.{h,m}"
  #   end
  # end

  # s.subspec 'Tools' do |ss3|
  #   ss3.source_files  = "CZLibrary/CZLibrary/Lbirary/Tools/*.{h,m}"
  # end

  # s.subspec 'UI' do |ss4|
  #   ss4.source_files  = "CZLibrary/CZLibrary/Lbirary/UI/*.{h,m}"
  # end

# 排除资源
  # s.exclude_files = "Classes/Exclude"

# 图片
  s.resources = "CZLibrary/CZLibrary/Lbirary/Assets/*.png"
  

#ui
  # s.dependency 'Masonry', '~> 1.0'
  #s.dependency 'SDWebImage', '~> 4.0'
  s.dependency 'SVProgressHUD', '~> 2.0'
  s.dependency 'MBProgressHUD', '~> 1.1'
  #s.dependency 'MJRefresh', '~> 3.0'
  #s.dependency 'DZNEmptyDataSet', '~> 1.8'

#network
  #s.dependency 'AFNetworking', '~> 3.0'

#tool
  #s.dependency 'MJExtension', '~>3.0'
  #s.dependency 'YYCache', '~>1.0'
  #s.dependency 'IQKeyboardManager', '~>6.0'
  s.dependency 'CocoaLumberjack', '~>3.4'


  s.requires_arc = true

end
