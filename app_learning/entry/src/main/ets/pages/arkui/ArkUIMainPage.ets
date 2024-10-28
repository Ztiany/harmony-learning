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
      new PageEntrance("Component Lifecycle", "pages/arkui/lifecycle/ComponentLifecyclePage"),
      new PageEntrance("Builder 的使用", "pages/arkui/builder/BuilderPage"),
      new PageEntrance("Customize Layout", "pages/arkui/clayout/CustomizeLayoutPage")
    ]
  }
}