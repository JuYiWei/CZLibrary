
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
  # s.exclude_files = "Classes/Exclude"

  s.public_header_files = "CZLibrary/CZLibrary/CZLibrary/CZLibrary.h"

  # s.resources = "Resources/*.png"

  s.requires_arc = true

end
