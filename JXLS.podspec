Pod::Spec.new do |s|
  s.name         = "JXLS"
  s.version      = "1.01"
  s.summary      = "JXLS is an ObjC++ wrapper and framework for xlslib. xlslib is a C++/C library to construct Microsoft Excel™ .xls files in code."
  s.homepage     = "https://github.com/JanX2/JXLS"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  s.authors      = { "Jan Weiß" => "jan@geheimwerk.de", "David Hoerl" => "dhoerl@mac.com" }
  s.source       = { :git => "https://github.com/JanX2/JXLS.git", :submodules => true, :tag => s.version.to_s }
  s.source_files = "*.{h,mm}", "External/xlslib/xlslib/src/**/*.{h,cpp}"
  s.public_header_files = "External/xlslib/xlslib/src/common/xlstypes.h", "External/xlslib/xlslib/src/xlslib.h", "{JXLSWorkBook,JXLSWorkSheet,JXLSCell,JXLSFont,JXLSFormat,JXLSExtendedFormat,JXLSRange}.h" 
  s.header_mappings_dir = '.'
  s.requires_arc = true
  s.libraries    = "c++"
  s.xcconfig     = { "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/JXLS/External/xlslib/xlslib/src/**" }
  s.ios.prefix_header_file = "JXLS_Prefix.pch"
  s.osx.prefix_header_file = "JXLS_Prefix.pch"
  s.ios.deployment_target = "6.1"
  s.osx.deployment_target = "10.7"
  s.exclude_files = "External/xlslib/xlslib/src/xlslib/cbridge.{h,cpp}"
end
