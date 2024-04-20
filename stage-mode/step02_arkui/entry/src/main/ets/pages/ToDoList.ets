import ViewModel from "../feature/todo/viewmodel/ToDoViewModel"
import Constant from "../feature/todo/common/Constant"
import ToDoItem from "../feature/todo/view/ToDoItem"

@Entry
@Component
struct ToDoList {
  private totalTasks: Array<string> = [];

  aboutToAppear() {
    this.totalTasks = ViewModel.getData();
  }

  build() {
    Column({ space: Constant.COLUMN_SPACE }) {
      /* Header */
      Text($r('app.string.page_title'))
        .fontSize($r('app.float.title_font_size'))
        .fontWeight(FontWeight.Bold)
        .lineHeight($r('app.float.title_font_height'))
        .width(Constant.TITLE_WIDTH)
        .margin({
          top: $r('app.float.title_margin_top'),
          bottom: $r('app.float.title_margin_bottom')
        })
        .textAlign(TextAlign.Start)

      /* List */
      ForEach(this.totalTasks, (item: string) => {
        ToDoItem({
          content: item
        })
      }, (item: string) => JSON.stringify(item));

    }
    .width(Constant.FULL_LENGTH)
    .height(Constant.FULL_LENGTH)
    .backgroundColor($r("app.color.todo_page_background"))
  }
}