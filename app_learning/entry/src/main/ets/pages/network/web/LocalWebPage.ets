/**
 * 具体参考：<https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101717497640610394>
 */
@Entry
@Component
struct LocalWebPage {
  @State message: string = 'Hello World';

  build() {
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
}