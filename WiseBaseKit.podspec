Pod::Spec.new do |s|
s.name = 'WiseBaseKit'
s.version = '1.5.0'
s.license = 'GPL-3.0'
s.summary = 'iOS 封装的基础库，可使得开发项目更容易'
s.homepage = 'https://github.com/diaoerlangdang/WiseBaseKit'
s.authors = { 'wise' => '99487616@qq.com' }
s.source = { :git => 'https://github.com/diaoerlangdang/WiseBaseKit.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'WiseBaseKit/*.{h,m}', 'WiseBaseKit/3rd/IconButton/*.{h,m}', 'WiseBaseKit/Config/*.{h,m}', 'WiseBaseKit/define/*.{h,m}', 'WiseBaseKit/UI/*.{h,m}', 'WiseBaseKit/UI/Categories/*.{h,m}', 'WiseBaseKit/UI/FragmentController/*.{h,m}', 'WiseBaseKit/UI/GuidViewController/*.{h,m}', 'WiseBaseKit/UI/NavigationController/*.{h,m}', 'WiseBaseKit/UI/TabBarController/*.{h,m}', 'WiseBaseKit/UI/View/*.{h,m}', 'WiseBaseKit/UI/View/WWSegmentView/*.{h,m}', 'WiseBaseKit/UI/View/WWTableView/*.{h,m}', 'WiseBaseKit/UI/View/WWTextField/*.{h,m}', 'WiseBaseKit/UI/View/WWTextView/*.{h,m}', 'WiseBaseKit/UI/View/WWWebView/*.{h,m}', 'WiseBaseKit/UI/ViewController/*.{h,m}', 'WiseBaseKit/UI/WWIconLabel/*.{h,m}', 'WiseBaseKit/Utils/*.{h,m}'
s.resource = 'WiseBaseKit/resource/WiseKitResource.bundle'
s.framework = 'Foundation', 'UIKit', 'AudioToolbox'
s.dependency 'MJRefresh','~> 3.1'
s.dependency 'Masonry','~>1.1'
end