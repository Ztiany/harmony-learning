import { FontSize, FontWeight, ItemStyle, WEIGHT } from '../common/Constant';

@Component
export struct ListItemComponent {
  index?: number;
  vote: string;
  private name?: Resource;

  /*
   @Prop 与 @State 有相同的语义，但初始化方式不同。@Prop 装饰的变量必须使用其父组件提供的 @State 变量进行初始化，
   允许组件内部修改 @Prop 变量，但更改不会通知给父组件，即 @Prop 属于单向数据绑定。
   */
  @Prop isSwitchDataSource: boolean;

  /*
    The state is related to the font color of ListItemComponent.

    @State 装饰的变量是组件内部的状态数据，当这些状态数据被修改时，将会调用所在组件的 build 方法进行 UI 刷新。
   */
  @State isChange: boolean = false;

  build() {
    Row() {
      Column() {
        if (this.isRenderCircleText()) {
          if (this.index !== undefined) {
            this.CircleText(this.index);
          }
        } else {
          Text(this.index?.toString())
            .lineHeight(ItemStyle.TEXT_LAYOUT_SIZE)
            .textAlign(TextAlign.Center)
            .width(ItemStyle.TEXT_LAYOUT_SIZE)
            .fontWeight(FontWeight.BOLD)
            .fontSize(FontSize.SMALL)
        }
      }
      .width(ItemStyle.LAYOUT_WEIGHT_LEFT)
      .alignItems(HorizontalAlign.Start)

      Text(this.name)
        .width(ItemStyle.LAYOUT_WEIGHT_CENTER)
        .fontWeight(FontWeight.BOLDER)
        .fontSize(FontSize.MIDDLE)
        .fontColor(this.isChange ? ItemStyle.COLOR_BLUE : ItemStyle.COLOR_BLACK)
      Text(this.vote)
        .width(ItemStyle.LAYOUT_WEIGHT_RIGHT)
        .fontWeight(FontWeight.BOLD)
        .fontSize(FontSize.SMALL)
        .fontColor(this.isChange ? ItemStyle.COLOR_BLUE : ItemStyle.COLOR_BLACK)
    }
    .height(ItemStyle.BAR_HEIGHT)
    .width(WEIGHT)
    .onClick(() => {
      this.isSwitchDataSource = !this.isSwitchDataSource;
      this.isChange = !this.isChange;
    })
  }

  @Builder CircleText(index: number) {
    Row() {
      Text(this.index?.toString())
        .fontWeight(FontWeight.BOLD)
        .fontSize(FontSize.SMALL)
        .fontColor(Color.White);
    }
    .justifyContent(FlexAlign.Center)
    .borderRadius(ItemStyle.CIRCLE_TEXT_BORDER_RADIUS)
    .size(
      {
        width: ItemStyle.CIRCLE_TEXT_SIZE,
        height: ItemStyle.CIRCLE_TEXT_SIZE
      }
    )
    .backgroundColor($r('app.color.circle_text_background'))
  }

  isRenderCircleText(): boolean {
    // Just render the element before the fourth in the list.
    return this.index === 1 || this.index === 2 || this.index === 3;
  }
}