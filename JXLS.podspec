Pod::Spec.new do |s|
  s.name         = "JXLS"
  s.version      = "0.0.1"
  s.summary      = "JXLS is an ObjC++ wrapper and framework for xlslib. xlslib is a C++/C library to construct Microsoft Excel™ .xls files in code."
  s.homepage     = "https://github.com/JanX2/JXLS"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  s.authors      = { "Jan Weiß" => "jan@geheimwerk.de", "David Hoerl" => "dhoerl@mac.com" }
  s.source       = { :git => "https://github.com/JanX2/JXLS.git", :submodules => true, :commit => "b2932259930cc75980cb04caca22708cd4dd73f0" }
  s.source_files = "*.{h,mm}", "External/xlslib/xlslib/src/**/*.{h,cpp}"
  s.requires_arc = true
  s.libraries    = "c++"
  s.xcconfig     = { "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/JXLS/External/xlslib/xlslib/src/**" }
  s.prefix_header_file = "JXLS_Prefix_iOS.pch"
  s.exclude_files = "External/xlslib/xlslib/src/xlslib/cbridge.{h,cpp}"
end
