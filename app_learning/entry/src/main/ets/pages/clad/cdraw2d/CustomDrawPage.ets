/**
 * 演示如果进行自定义绘制。
 */
@Entry
@Component
struct CustomDrawPage {

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