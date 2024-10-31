import { Entrance, PageEntrance } from '../../entrance/Entrance';
import { EntranceList } from '../../entrance/EntranceList';

function buildEntrance(): Array<Entrance> {
  return [
    new PageEntrance("Tabs 页面架构", "pages/parch/tabs/TabsPage"),
    new PageEntrance("Navigation 页面架构", "pages/parch/navigation/NavigationPage"),
  ]
}

@Entry
@Component
struct PageArchitectPage {
  @State list: Array<Entrance> = buildEntrance()

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
}