import { ToDoItem } from './ToDoItem'

@Entry
@Component
struct ToDoListPage {
  @State
  private todoList: Array<string> = [
    "学习 ArkTS",
    "学习 ArkUI",
    "学习 UIAbility",
    "学习 Everything",
  ]

  build() {
    Column() {
      Text("ToDo List")
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      ForEach(this.todoList, (item: string) => {
        ToDoItem({
          content: item,
        })
      })
    }
    .width("100%")
    .height("100%")
  }
}