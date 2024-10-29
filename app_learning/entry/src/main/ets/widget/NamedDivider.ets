@Component
export default struct NamedDivider {
  @Require name: string = ''

  build() {
    Text(this.name)
      .fontColor($r('sys.color.white'))
      .backgroundColor("#123456")
      .fontWeight(FontWeight.Bold)
      .padding(20)
      .width("100%")
  }
}