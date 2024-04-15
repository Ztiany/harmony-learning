// 导入页面路由模块
import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        // 添加按钮，以响应用户点击
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        // 跳转按钮绑定 onClick 事件，点击时跳转到第二页
        .onClick(() => {
          router.pushUrl({ url: 'pages/second' })
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}