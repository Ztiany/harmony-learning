import { LifecycleComponent } from './LifecycleComponent';

/**
 * 演示在 LifecycleComponent 中监听 ComponentLifecyclePage 的生命周期事件。
 */
@Entry
@Component
struct ComponentLifecyclePage {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      LifecycleComponent()
    }
    .height('100%')
    .width('100%')
  }
}