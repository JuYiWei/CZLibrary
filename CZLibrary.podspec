
Pod::Spec.new do |s|

  s.name         = "CZLibrary"
  s.version      = "0.0.1"
  s.summary      = "cz self library summary"
  s.description  = "cz self library description"
  s.homepage     = "https://github.com/JuYiWei/CZLibrary"
  s.license      = "MIT"
  s.author       = { "juyw" => "757832801@qq.com" }

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/JuYiWei/CZLibrary.git", :tag => "#{s.version}" }


  s.source_files  = "CZLibrary/CZLibrary/Lbirary/*.{h,m}"

  s.subspec 'Category' do |ss1|
    ss1.subspec 'UIKit' do |sss1|
      sss1.source_files  = "CZLibrary/CZLibrary/Lbirary/Category/UIKit/*.{h,m}"
    end
    ss1.subspec 'Foundation' do |sss2|
      sss2.source_files  = "CZLibrary/CZLibrary/Lbirary/Category/Foundation/*.{h,m}"
    end
  end

  # s.exclude_files = "Classes/Exclude"

  # s.resources = "Resources/*.png"

  s.requires_arc = true

end
