import { Entrance, PageEntrance } from '../../entrance/Entrance'
import { EntranceList } from '../../entrance/EntranceList'

/**
 * Clad（customize layout and draw），演示自定义布局和绘制。
 */
@Entry
@Component
struct CladPage {
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
      new PageEntrance("自定义布局", "pages/clad/clayout/CustomizeLayoutPage"),
      new PageEntrance("自定义绘制", "pages/clad/cdraw2d/CustomDrawPage")
    ]
  }
}