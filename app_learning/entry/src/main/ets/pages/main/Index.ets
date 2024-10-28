import { buildEntrance } from './Data'
import { Entrance } from '../../entrance/Entrance'
import { EntranceList } from '../../entrance/EntranceList'

@Entry
@Component
struct Index {
  @State list: Array<Entrance> = buildEntrance()
  private clickBackTimeRecord: number = 0;

  /**
   * 组件即将出现时回调该接口，具体时机为在创建自定义组件的新实例后，在执行其 build() 函数之前执行。
   */
  aboutToAppear(): void {
    console.info("Index is aboutToAppear")
  }

  build() {
    Column() {
      Text("Harmony App Learning")
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      EntranceList({ list: this.list })
        .margin({
          top: 20
        })
    }
    .height('100%')
    .width('100%')
  }

  /**
   * 组件 build() 函数执行完成之后回调该接口，不建议在 onDidBuild 函数中更改状态变量、使用 animateTo 等功能，这可能会导致不稳定的 UI 表现。
   */
  onDidBuild(): void {
    console.info("Index onDidBuild")
  }

  /**
   * 页面每次显示时触发一次，包括路由过程、应用进入前台等场景。【Entry Only】
   */
  onPageShow(): void {
    console.info("Index onPageShow")
  }

  /**
   * 当用户点击返回按钮时触发。【Entry Only】
   */
  onBackPress(): boolean | void {
    const time = new Date().getTime()
    if (time - this.clickBackTimeRecord > 2000) {
      this.getUIContext().getPromptAction().showToast({
        message: 'Click again to exit.',
        duration: 2000
      })
      this.clickBackTimeRecord = time
      return true
    }
    console.info("Index onBackPress")
  }

  /**
   * 页面每次隐藏时触发一次，包括路由过程、应用进入后台等场景。【Entry Only】
   */
  onPageHide(): void {
    console.info("Index onPageHide")
  }

  /**
   * aboutToDisappear 函数在自定义组件析构销毁之前执行。不允许在 aboutToDisappear 函数中改变状态变量，特别是 @Link 变量的修改可能会导致
   * 应用程序行为不稳定。
   */
  aboutToDisappear(): void {
    console.info("Index is aboutToDisappear")
  }
}