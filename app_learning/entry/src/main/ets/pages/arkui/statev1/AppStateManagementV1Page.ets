import { logger } from '../../../utils/Logger'
import NamedDivider from '../../../widget/NamedDivider'

const TAG = "Storage"

/** 存储在内存中。*/
const localStorage = new LocalStorage()

/** 在 UIAbility 的 loadContent 中设置共享的 Storage。*/
const sharedStorage = LocalStorage.getShared()


@Builder
function usageOfLocalStorage() {
  Button("use LocalStorage")
    .onClick(() => {
      localStorage.setOrCreate("A", "A")
      localStorage.setOrCreate("number", 1)
      let propertyA: SubscribedAbstractProperty<string> = localStorage.link("A");
      logger.d(TAG, `A is ${localStorage.get("A")}.`)
      propertyA.set("AA")
      logger.d(TAG, `A is ${localStorage.get("A")}.`)
      logger.d(TAG, `name is ${sharedStorage.get("name")}.`)
    })
}

@Builder
function changeAppStorage() {
  Button("changeAppStorage")
    .onClick(() => {
      if (!AppStorage.get("number")) {
        AppStorage.setOrCreate("number", 1)
        return
      }
      AppStorage.set("number", (AppStorage.get("number") as number) + 1)
    })
}

@Builder
function changeLocalStorage() {
  Button("changeLocalStorage")
    .onClick(() => {
      if (!localStorage.get("number")) {
        localStorage.setOrCreate("number", 1)
        return
      }
      localStorage.set("number", (localStorage.get("number") as number) + 1)
    })
}

@Entry(localStorage)
@Component({
  /*
  自定义组件冻结功能专为优化复杂 UI 页面的性能而设计，尤其适用于包含多个页面栈、长列表或宫格布局的场景。在这些情况下，当状态变量绑定了多个 UI 组
  件，其变化可能触发大量 UI 组件的刷新，进而导致界面卡顿和响应延迟。为了提升这类负载 UI 界面的刷新性能，开发者可以选择尝试使用自定义组件冻结功能。
  具体参考：<https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-custom-components-freeze-V5>
  */
  freezeWhenInactive: true
})
struct AppStateManagementPage {
  /** 连接的是 localStorage。*/
  @LocalStorageLink('number') localNumber: number = -1;
  /** 连接的是 AppStorage。*/
  @StorageLink('number') appNumber: number = -1;
  /**
   * 连接的是 AppStorage，StorageProp 关联的环境参数可以在本地更改，但不能同步回 AppStorage 中，因为应用对环境变量参数是不可写的，只能在
   * Environment 中查询。
   */
  @StorageProp('languageCode') languageCode: string = "unknown";

  build() {
    Scroll() {
      Column() {
        NamedDivider({ name: "LocalStorage usage" })
        Text(`number from local storage: ${this.localNumber}`)
        usageOfLocalStorage()
        changeLocalStorage()


        NamedDivider({ name: "AppStorage" })
        Text(`number from app storage: ${this.appNumber}`)
        changeAppStorage()


        NamedDivider({ name: "PersistentStorage" })
        // 在 UIAbility 中已经调用 persistProp，这里其实是没有必要的。
        Button("Persistent app number(unnecessary)").onClick(() => {
          PersistentStorage.persistProp("number", this.appNumber)
        })


        NamedDivider({ name: "Environment" })
        Text(`languageCode is: ${this.languageCode}`)
      }
      .width('100%')
    }
    .align(Alignment.Top)
    .scrollable(ScrollDirection.Vertical)
    .height('100%')
    .width('100%')
  }
}
