import { NavigationPageOne } from './NavigationPageOne'

/**
 * 具体参考：<https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101717497640610394>
 */
@Entry
@Component
struct NavigationPage {
  @State fakeToolbarItems: ToolbarItem[] = [
    {
      'value': "Game",
      'icon': $r("app.media.main_icon_game_normal"),
      'action': () => {
      }
    },
    {
      'value': "Farewell",
      'icon': $r("app.media.main_icon_farewell_normal"),
      'action': () => {
      }
    },
    {
      'value': "Mine",
      'icon': $r("app.media.main_icon_mine_normal"),
      'action': () => {
      }
    },
  ]
  @Provide('navStack') navStack: NavPathStack = new NavPathStack()

  build() {
    Column() {
      Navigation(this.navStack) {
        this.GamePage()
      }
      .title("NavigationDemo")
      .navDestination(this.PageMap)
      .toolbarConfiguration(this.fakeToolbarItems)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }

  @Builder
  PageMap(name: string) {
    if (name === "pageOne") {
      NavigationPageOne()
    }
  }

  @Builder
  GamePage() {
    Button("OpenPageOne")
      .onClick(() => {
        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
        this.navStack.pushPathByName('pageOne', null);
      })
  }
}
