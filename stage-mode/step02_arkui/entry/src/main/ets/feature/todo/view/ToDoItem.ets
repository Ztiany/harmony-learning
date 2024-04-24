import Constant from '../common/Constant';

@Component
export default struct ToDoItem {
  private content?: string;
  @State isCompleted: boolean = false;

  @Builder labelIcon(icon: Resource) {
    Image(icon)
      // 缩放类型
      .objectFit(ImageFit.Contain)
        /* 引用资源 */
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }

  build() {
    Row() {
      if (this.isCompleted) {
        this.labelIcon($r("app.media.ic_completed"));
      } else {
        this.labelIcon($r("app.media.ic_uncompleted"));
      }

      Text(this.content)
        .fontSize($r('app.float.item_font_size'))
        .fontWeight(Constant.FONT_WEIGHT)
        .opacity(this.isCompleted ? Constant.OPACITY_COMPLETED : Constant.OPACITY_DEFAULT)
        .decoration({ type: this.isCompleted ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .borderRadius(Constant.BORDER_RADIUS)
    .backgroundColor($r('app.color.start_window_background'))
    .width(Constant.LIST_DEFAULT_WIDTH)
    .height($r('app.float.list_item_height'))
    .onClick(() => {
      this.isCompleted = !this.isCompleted;
    })
  } //build end

}