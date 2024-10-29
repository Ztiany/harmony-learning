/**
 * 如果需要通过测算的方式布局自定义组件内子组件的位置，建议使用以下接口：
 *
 *  - onMeasureSize：组件每次布局时触发，计算子组件的尺寸，其执行时间先于 onPlaceChildren。
 *  - onPlaceChildren：组件每次布局时触发，设置子组件的起始位置。
 */
@Component
export struct DemoLayout {
  @Builder
  doNothingBuilder() {
  };

  @BuilderParam builder: () => void = this.doNothingBuilder;
  @State startSize: number = 100;
  result: SizeResult = {
    width: 0,
    height: 0
  };

  // 第一步：计算各子组件的大小
  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Array<Measurable>, constraint: ConstraintSizeOptions) {
    console.log("onMeasureSize")
    let size = 80;
    children.forEach((child) => {
      child.measure({
        minHeight: size,
        minWidth: size,
        maxWidth: size,
        maxHeight: size
      })
      size /= 2;
    })
    this.result.width = 90;
    this.result.height = 90;
    return this.result;
  }

  // 第二步：放置各子组件的位置
  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Array<Layoutable>, constraint: ConstraintSizeOptions) {
    console.log("onPlaceChildren")
    let startPos = 90;
    children.forEach((child) => {
      let pos = startPos - child.measureResult.height;
      child.layout({ x: pos, y: pos })
    })
  }

  build() {
    this.builder()
  }
}