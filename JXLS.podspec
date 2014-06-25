Pod::Spec.new do |s|
  s.name         = "JXLS"
  s.version      = "0.0.1"
  s.summary      = "JXLS is an ObjC++ wrapper and framework for xlslib. xlslib is a C++/C library to construct Microsoft Excel™ .xls files in code."
  s.homepage     = "https://github.com/JanX2/JXLS"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  s.authors      = { "Jan Weiß" => "jan@geheimwerk.de", "David Hoerl" => "dhoerl@mac.com" }
  s.source       = { :git => "https://github.com/master-nevi/JXLS.git", :submodules => true, :commit => "2ff5912d9b586f86846326869af0ad0888bbaac6" }
  s.source_files = "*.{h,mm}", "External/xlslib/xlslib/src/**/*.{h,cpp}"
  s.requires_arc = true
  s.libraries    = "c++"
  s.xcconfig     = { "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/JXLS/External/xlslib/xlslib/src/**" }
  s.ios.prefix_header_file = "JXLS_Prefix_iOS.pch"
  s.osx.prefix_header_file = "JXLS_Prefix.pch"
  s.ios.deployment_target = "6.1"
  s.osx.deployment_target = "10.7"
  s.exclude_files = "External/xlslib/xlslib/src/xlslib/cbridge.{h,cpp}"
end
