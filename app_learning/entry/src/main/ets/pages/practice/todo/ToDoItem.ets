@Component
export struct ToDoItem {
  private content?: string;
  @State isComplete: boolean = false;

  build() {
    Row() {
      if (this.isComplete) {
        this.labelIcon($r(`app.media.ic_check_ok`))
      } else {
        this.labelIcon($r(`app.media.ic_check_default`))
      }

      Text(this.content)
        .fontSize(14)
        .fontColor($r('sys.color.white'))
        .opacity(this.isComplete ? 0.4 : 1)
        .decoration({
          type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None
        })

    }
    .padding({
      top: 10,
      bottom: 10,
    })
    .margin({
      top: 10,
      bottom: 10,
    })
    .width("100%")
    .borderRadius(24)
    .backgroundColor("#FF6C9FD0")
    .onClick(() => {
      this.isComplete = !this.isComplete
    })
  }

  @Builder
  private labelIcon(icon: Resource) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .margin(10)
      .width(20)
      .height(20)
  }
}