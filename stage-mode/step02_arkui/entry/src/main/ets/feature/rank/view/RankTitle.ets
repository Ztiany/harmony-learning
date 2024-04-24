import AppContext from '@ohos.app.ability.common';
import { FontSize, TitleBarStyle, WEIGHT } from '../common//Constant';

@Component
export struct TitleComponent {

  /*
  @Link 装饰的变量可以和父组件的 @State 变量建立双向数据绑定，需要注意的是：@Link 变量不能在组件内部进行初始化。
   */
  @Link isRefreshData: boolean; // User click the button to decide whether to switch data.

  /* 注意：string 资源中的字符串不能为空字符串，这可能是构建系统的 Bug。 */
  @State title: Resource = $r('app.string.title_default');

  build() {
    Row() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .height(TitleBarStyle.IMAGE_BACK_SIZE)
          .width(TitleBarStyle.IMAGE_BACK_SIZE)
          .margin({ right: TitleBarStyle.IMAGE_BACK_MARGIN_RIGHT })
          .onClick(() => {
            // 获取 UIAbility 对应的 Context，然后终结自己。
            let handler = getContext(this) as AppContext.UIAbilityContext;
            handler.terminateSelf();
          })
        Text(this.title)
          .fontSize(FontSize.LARGE)
      }
      .width(TitleBarStyle.WEIGHT)
      .height(WEIGHT)
      .justifyContent(FlexAlign.Start)

      Row() {
        Image($r('app.media.icon_refresh'))
          .height(TitleBarStyle.IMAGE_LOADING_SIZE)
          .width(TitleBarStyle.IMAGE_LOADING_SIZE)
          .onClick(() => {
            this.isRefreshData = !this.isRefreshData;
          })
      }
      .width(TitleBarStyle.WEIGHT)
      .height(WEIGHT)
      // 设置子组件在主轴方向上的对齐格式。
      .justifyContent(FlexAlign.End)
    }
    .width(WEIGHT)
    .padding(
      {
        left: TitleBarStyle.BAR_MARGIN_HORIZONTAL,
        right: TitleBarStyle.BAR_MARGIN_HORIZONTAL }
    )
    .margin({ top: TitleBarStyle.BAR_MARGIN_TOP })
    .height(TitleBarStyle.BAR_HEIGHT)
    .justifyContent(FlexAlign.SpaceAround)
  }
}