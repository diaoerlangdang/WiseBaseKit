# WiseBaseKit
## iOS 封装的基础库，可使得开发项目更容易

## 安装

### CocoaPods
要使用CocoaPods安装wiseBle，请将其集成到您现有的Podfile中，或创建一个新的Podfile:

```ruby
target 'MyApp' do
  pod 'WiseBaseKit'
end
```
然后 `pod install`.

### 手动

将WiseBaseKit文件夹添加到项目中


## 使用方法
```objective-c
#import <WiseBaseKit/WiseBaseKit.h>
```

## 介绍
<ul>
  <li>一些基本的宏，如iOS版本判断、颜色、字体等</li>
  <li>工具类，如正则、加密、json转换等</li>
  <li>基类WWBaseViewController，所有的controller都为其子类，自带返回，可设置无数据时显示的文字和图片</li>
  <li>WWBaseTableViewController、WWBaseCollectionViewController可设置是否显示下拉刷新、上拉加载</li>
  <li>WWBaseFragmentController 一个类似安卓中fragment的管理器</li>
  <li>WWBaseGuidViewController该类可快速实现向导页面</li>
  <li>WWWebView 网页view，带进度条</li>
  <li>WWSegmentView 类似于网易顶部的bar，可配合WWBaseFragmentController使用</li>
  <li>WWNavigationController push时，自动隐藏tabBar</li>
  <li>UIColor、UIImage、UIView 的一些Categories</li>
  <li>WWConfigInfo 包含版本号的判断，可继承该类添加一些项目的配置信息</li>
</ul>


## 使用的第三方库

<p><a href="https://github.com/CoderMJLee/MJRefresh">MJRefresh</a> 和 <a href="https://github.com/SnapKit/Masonry">Masonry</a></p>
