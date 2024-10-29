import { Entrance, PageEntrance } from '../../entrance/Entrance'
import { EntranceList } from '../../entrance/EntranceList'

@Entry
@Component
struct ArkUIMainPage {
  @State list: Array<Entrance> = this.buildEntrance()

  build() {
    Stack() {
      EntranceList({ list: this.list })
    }
    .height('100%')
    .width('100%')
  }

  private buildEntrance(): Array<Entrance> {
    return [
      new PageEntrance("观察生命周期", "pages/arkui/lifecycle/ComponentLifecyclePage"),
      new PageEntrance("Builder 的使用", "pages/arkui/builder/BuilderPage"),
      new PageEntrance("组件状态管理（V1）", "pages/arkui/statev1/StateManagementV1Page"),
      new PageEntrance("应用状态管理（V1）", "pages/arkui/statev1/AppStateManagementV1Page"),
      new PageEntrance("组件状态管理（V2）", "pages/arkui/statev2/StateManagementV2Page"),
      new PageEntrance("应用状态管理（V2）", "pages/arkui/statev2/AppStateManagementV2Page"),
    ]
  }
}