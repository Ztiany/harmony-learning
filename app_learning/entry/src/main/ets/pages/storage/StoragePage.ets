@Entry
@Component
struct StoragePage {
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