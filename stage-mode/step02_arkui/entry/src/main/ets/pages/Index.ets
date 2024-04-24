import "@ohos.router"
import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'ArkUI 学习列表'

  /* @Builder 装饰器：自定义构建函数。 */
  @Builder Entrance(name: string, url: string) {
    Button(name)
      .fontSize(14)
      .padding(20)
      .fontColor(Color.White)
      .width('90%')
      .margin(10)
      .onClick(() => {
        router.pushUrl({ url: url })
      })
  }

  build() {
    // 元素默认是居中的
    Column() {

      Text(this.message)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)

      this.Entrance("Rank List", "pages/Rank");
      this.Entrance("ToDo List", "pages/ToDoList");

    }
    .width('100%')
  }
}