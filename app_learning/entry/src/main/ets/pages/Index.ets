import { Entrance, PageEntrance } from '../entrance/Entrance'
import { EntranceList } from '../entrance/EntranceList'

function buildEntrance(): Array<Entrance> {
  return [
    new PageEntrance("UI 组件及其状态", "pages/arkui/ArkUIMainPage"),
    new PageEntrance("自定义布局与绘制", "pages/clad/CladPage"),
    new PageEntrance("Page Architecture", "pages/parch/PageArchitectPage"),
    new PageEntrance("自适应与响应式布局", "pages/arkui/ArkUIMainPage"),
    new PageEntrance("Ability 之间的交互", "pages/ability/AbilityPage"),
    new PageEntrance("事件通知机制", "pages/ability/AbilityPage"),
    new PageEntrance("网络技术应用", "pages/network/NetworkPage"),
    new PageEntrance("数据持久化", "pages/network/NetworkPage"),
    new PageEntrance("多媒体技术", "pages/network/NetworkPage"),
    new PageEntrance("Practice Demo", "pages/practice/PracticePage")
  ]
}

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