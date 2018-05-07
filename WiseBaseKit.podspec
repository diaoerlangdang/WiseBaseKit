Pod::Spec.new do |s|
s.name = 'WiseBaseKit'
s.version = '1.2.1'
s.license = 'GPL-3.0'
s.summary = 'iOS 封装的基础库，可使得开发项目更容易'
s.homepage = 'https://github.com/diaoerlangdang/WiseBaseKit'
s.authors = { 'wise' => '99487616@qq.com' }
s.source = { :git => 'https://github.com/diaoerlangdang/WiseBaseKit.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'WiseBaseKit/**/*'
s.resource = 'WiseBaseKit/resource/WiseKitResource.bundle'
s.framework = 'Foundation', 'UIKit', 'AudioToolbox'
s.dependency 'MJRefresh','~> 3.1'
s.dependency 'Masonry','~>1.1'
end