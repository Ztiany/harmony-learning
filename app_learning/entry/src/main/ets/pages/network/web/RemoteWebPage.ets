import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';

/**
 * 具体参考：<https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101717497640610394>
 */
@Entry
@Component
struct RemoteWebPage {
  @State title: string = 'Loading...';
  controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Text(this.title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin(15)

      RelativeContainer() {
        Web({ src: "https://developer.huawei.com/consumer/cn/", controller: this.controller })
          .onTitleReceive((titleEvent: OnTitleReceiveEvent) => {
            this.title = titleEvent.title
          })
          .width("100%")
          .height("100%")

        Button("切换到百度")
          .alignRules({
            right: {
              anchor: "__container__",
              align: HorizontalAlign.End
            },
            bottom: {
              anchor: "__container__",
              align: VerticalAlign.Bottom
            }
          })
          .margin({
            right: 20, bottom: 40
          })
          .onClick(() => {
            try {
              // 点击按钮时，通过 loadUrl，跳转到百度首页。
              this.controller.loadUrl('https://www.baidu.com/');
            } catch (error) {
              let e: BusinessError = error as BusinessError;
              console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
            }
          })
      }
    }
  }
}