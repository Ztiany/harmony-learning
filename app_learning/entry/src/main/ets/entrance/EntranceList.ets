import { Entrance } from './Entrance'

@Component
export struct EntranceList {
  /*
   @Prop 与 @State 有相同的语义，但初始化方式不同。@Prop 装饰的变量必须使用其父组件提供的 @State 变量进行初始化，
   允许组件内部修改 @Prop 变量，但更改不会通知给父组件，即 @Prop 属于单向数据绑定【即只能子组件感受到父组件的变化】。
   */
  @Prop list: Array<Entrance>

  build() {
    List() {
      ForEach(this.list, (item: Entrance) => {
        ListItem() {
          this.EntranceItem(item)
        }
      }, (item: Entrance) => {
        return item.name
      })
    }
    .listDirection(Axis.Vertical)
    .height('100%')
    .width('100%')
  }

  @Builder
  EntranceItem(item: Entrance) {
    Button(item.name)
      .fontSize(18)
      .fontColor($r('sys.color.white'))
      .onClick(() => {
        item.open();
      })
      .padding({
        top: 15,
        bottom: 15,
      })
      .margin({
        top: 5,
        bottom: 5,
      })
      .type(ButtonType.Normal)
      .width('100%')
  }
}