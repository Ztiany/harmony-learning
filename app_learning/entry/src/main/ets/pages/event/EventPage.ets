/**
 * 演示 emitter 和 eventHub 的使用，参考
 *    <https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs-V5/faqs-ability-68-V5>。
 */
@Entry
@Component
struct EventPage {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text("TODO")
        .fontSize(40)
        .fontColor("#FF0000")
        .alignRules({
          middle: {
            anchor: "__container__",
            align: HorizontalAlign.Center
          },
          center: {
            anchor: "__container__",
            align: VerticalAlign.Center
          },
        })
    }
    .height('100%')
    .width('100%')
  }
}