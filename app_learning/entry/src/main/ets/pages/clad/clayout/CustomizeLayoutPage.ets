import { DemoLayout } from './DemoLayout';

/**
 * 演示如何进行自定义布局，即定制 measure 和 layout 的过程。
 */
@Entry
@Component
struct CustomizeLayoutPage {
  build() {
    Scroll() {
      Column() {
        DemoLayout({ builder: ColumnChildren })
      }
      .backgroundColor("#776677")
    }
    .width('100%')
  }
}

// 通过 builder 的方式传递多个组件，作为自定义组件的一级子组件（即不包含容器组件，如 Column）
@Builder
function ColumnChildren() {
  ForEach([1, 2, 3], (index: number) => { // 暂不支持 lazyForEach 的写法
    Text('S' + index)
      .fontSize(10)
      .width(100)
      .height(100)
      .borderWidth(2)
  })
}