export class Banner {
  id: string = ""
  imageSrc: ResourceStr = ""
  url: string = ""

  constructor(id: string, imageSrc: ResourceStr, url: string) {
    this.id = id
    this.imageSrc = imageSrc
    this.url = url
  }
}

export class Article {
  id: string = '';
  imageSrc: ResourceStr = '';
  title: string = '';
  brief: string = '';
  webUrl: string = '';

  constructor(id: string, imageSrc: ResourceStr, title: string, brief: string, webUrl: string) {
    this.id = id
    this.imageSrc = imageSrc
    this.title = title
    this.brief = brief
    this.webUrl = webUrl
  }
}

export function buildBannerList(): Array<Banner> {
  return [
    new Banner(
      'pic0',
      $r('app.media.banner_pic0'),
      'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'
    ),

    new Banner(
      'pic1',
      $r('app.media.banner_pic1'),
      'https://developer.huawei.com/consumer/cn/'
    ),

    new Banner(
      'pic2',
      $r('app.media.banner_pic2'),
      'https://developer.huawei.com/consumer/cn/deveco-studio/'
    ),

    new Banner(
      'pic3',
      $r('app.media.banner_pic3'),
      'https://developer.huawei.com/consumer/cn/arkts/'
    ),

    new Banner(
      'pic4',
      $r('app.media.banner_pic4'),
      'https://developer.huawei.com/consumer/cn/arkui/'
    ),

    new Banner(
      'pic5',
      $r('app.media.banner_pic5'),
      'https://developer.huawei.com/consumer/cn/sdk'
    )
  ]
}

export function buildEnablementList(): Array<Article> {
  return [
    new Article('1', $r('app.media.enablement_pic1'), 'HarmonyOS第一课',
      '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-video-courses/video-tutorials-0000001443535745'),
    new Article('2', $r('app.media.enablement_pic2'), '开发指南',
      '提供系统能力概述、快速入门，用于指导开发者进行场景化的开发。指南涉及到的知识点包括必要的背景知识、符合开发者实际开发场景的操作任务流（开发流程、开发步骤、调测验证）以及常见问题等。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/application-dev-guide-0000001630265101'),
    new Article('3', $r('app.media.enablement_pic3'), '最佳实践',
      '针对新发布特性及热点特性提供详细的技术解析和开发最佳实践。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/topic-architecture-0000001678045510'),
    new Article('4', $r('app.media.enablement_pic4'), 'CodeLabs',
      '以教学为目的的代码样例及详细的开发指导，帮助开发者一步步地完成指定场景的应用开发并掌握相关知识。CodeLabs将最新的鸿蒙生态应用开发技术与典型场景结合，让开发者快速地掌握开发高质量应用的方法。同时支持互动式操作，通过文字、代码和效果联动为开发者带来更佳的学习体验。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-codelabs/codelabs-0000001443855957'),
    new Article('5', $r('app.media.enablement_pic5'), 'Sample',
      '面向不同类型的开发者提供的鸿蒙生态应用开发优秀实践，每个Sample Code都是一个可运行的工程，为开发者提供实例化的代码参考。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-samples/samples-0000001162414961'),
    new Article('6', $r('app.media.enablement_pic6'), 'API参考',
      '面向开发者提供鸿蒙系统开放接口的全集，供开发者了解具体接口使用方法。API参考详细地描述了每个接口的功能、使用限制、参数名、参数类型、参数含义、取值范围、权限、注意事项、错误码及返回值等。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-references/development-intro-0000001580026066'),
    new Article('7', $r('app.media.enablement_pic7'), 'FAQ',
      '开发者常见问题的总结，开发者可以通过FAQ更高效地解决常见问题。FAQ会持续刷新，及时呈现最新的常见问题。',
      'https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs/faqs-development-0000001753952202'),
    new Article('8', $r('app.media.enablement_pic8'), '开发者论坛', '和其他应用开发者交流技术、共同进步。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
  ]
}

export function buildTutorialList(): Array<Article> {
  return [
    new Article('1', $r('app.media.tutorial_pic1'), 'Step1 环境的搭建',
      '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('2', $r('app.media.tutorial_pic2'), 'Step2 使用Swiper构建运营广告位',
      'Swiper组件提供滑动轮播显示的能力。Swiper本身是一个容器组件，当设置了多个子组件后，可以对这些子组件进行轮播显示。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('3', $r('app.media.tutorial_pic3'), 'Step3 创建和组合视图',
      'Item定义子组件相关特征。相关组件支持使用条件渲染、循环渲染、懒加载等方式生成子组件。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('4', $r('app.media.tutorial_pic4'), 'Step4 网格和列表组建的使用',
      '网格和列表组件中，当Item达到一定数量，内容超过屏幕大小时，可以自动提供滚动功能，适合用于呈现同类数据类型或数据类型集',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('5', $r('app.media.tutorial_pic5'), 'Step5 应用架构设计基础——MVVM模式',
      'ArkUI采取MVVM = Model + View + ViewModel模式，将数据与视图绑定在一起，更新数据的时候直接更新视图。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('6', $r('app.media.tutorial_pic6'), 'Step6 应用架构设计基础——三层架构',
      '为了更好地适配复杂应用的开发，建议采用三层架构的方式对整个应用的功能进行模块化，实现高内聚、低耦合开发。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('7', $r('app.media.tutorial_pic7'), 'Step6 ArkWeb页面适配',
      'ArkWeb（方舟Web）提供了Web组件，用于在应用程序中显示Web页面内容，为开发者提供页面加载、页面交互、页面调试等能力。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('8', $r('app.media.tutorial_pic8'), 'Step7 数据驱动UI更新', '数据更新的同时会直接驱动UI的改变',
      'xxx'),
    new Article('9', $r('app.media.tutorial_pic9'), 'Step8 设置组件导航',
      'Navigation组件适用于模块内页面切换，一次开发，多端部署场景。通过组件级路由能力实现更加自然流畅的转场体验，并提供多种标题栏样式来呈现更好的标题和内容联动效果。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('10', $r('app.media.tutorial_pic10'), 'Step9 原生智能：AI语音朗读',
      '文本转语音服务提供将文本信息转换为语音并进行播报的能力，便于用户与设备进行互动，实现实时语音交互，文本播报。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('11', $r('app.media.tutorial_pic11'), 'Step10 原生互联：分布式流转',
      '流转能力打破设备界限，多设备联动，使用户应用程序可分可合、可流转，实现如邮件跨设备编辑、多设备协同健身、多屏游戏等分布式业务。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
    new Article('12', $r('app.media.tutorial_pic12'), 'Step11 一次开发，多端部署',
      '一套代码工程，一次开发上架，多端按需部署。支撑开发者快速高效的开发支持多种终端设备形态的应用，实现对不同设备兼容的同时，提供跨设备的流转、迁移和协同的分布式体验。',
      'https://developer.huawei.com/consumer/cn/forum/home?all=1'),
  ]
}