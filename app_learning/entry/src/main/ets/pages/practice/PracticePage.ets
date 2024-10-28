import { Entrance, PageEntrance } from '../../entrance/Entrance'
import { EntranceList } from '../../entrance/EntranceList'

@Entry
@Component
struct PracticePage {
  @State
  list: Array<Entrance> = this.buildEntrance()

  build() {
    Stack() {
      EntranceList({
        list: this.list
      })
    }
    .height('100%')
    .width('100%')
  }

  private buildEntrance(): Array<Entrance> {
    return [
      new PageEntrance("TODO List", "pages/practice/todo/ToDoListPage")
    ]
  }
}