import { Entrance, PageEntrance } from '../../entrance/Entrance';
import { EntranceList } from '../../entrance/EntranceList';

function buildEntrance(): Array<Entrance> {
  return [
    new PageEntrance("Web 加载远程网页", "pages/network/web/RemoteWebPage"),
    new PageEntrance("Web 加载本地网页", "pages/network/web/LocalWebPage"),
    new PageEntrance("Http 请求", "pages/network/http/HttpRequestPage"),
  ]
}

@Entry
@Component
struct NetworkPage {
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