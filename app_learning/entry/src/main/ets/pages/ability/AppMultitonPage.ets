
@Entry
@Component
struct AppMultitonPage {
  @State message: string = 'I am a page for AppMultitonAbility';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('AppMultitonPageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}