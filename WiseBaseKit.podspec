Pod::Spec.new do |s|
s.name = 'WiseBaseKit'
s.version = '1.7.7'
s.license = 'GPL-3.0'
s.summary = 'iOS 封装的基础库，可使得开发项目更容易'
s.homepage = 'https://github.com/diaoerlangdang/WiseBaseKit'
s.authors = { 'wise' => '99487616@qq.com' }
s.source = { :git => 'https://github.com/diaoerlangdang/WiseBaseKit.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'


	s.subspec 'Define' do |ss|
		ss.source_files = 'WiseBaseKit/define/*.{h,m}'
	end

	s.subspec 'Utils' do |ss|
		ss.source_files = 'WiseBaseKit/Utils/*.{h,m}'
	end

	s.subspec 'Config' do |ss|
		ss.dependency 'WiseBaseKit/Utils'
		ss.source_files = 'WiseBaseKit/Config/*.{h,m}'
	end

	s.subspec 'UI' do |ss|
		ss.dependency 'WiseBaseKit/Define'
		ss.dependency 'WiseBaseKit/Utils'
		ss.dependency 'WiseBaseKit/Config'
		ss.source_files = 'WiseBaseKit/UI/*/*.{h,m}', 'WiseBaseKit/UI/View/*/*.{h,m}', 'WiseBaseKit/3rd/*/*.{h,m}', 'WiseBaseKit/WiseBaseKit.h', 'WiseBaseKit/UI/WWUI.h'
		ss.resource = 'WiseBaseKit/resource/WiseKitResource.bundle'
		s.framework = 'Foundation', 'UIKit', 'AudioToolbox'
		s.dependency 'MJRefresh','~> 3.1.17'
		s.dependency 'Masonry','~>1.1'
	end

	
end