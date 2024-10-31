@Component
export struct NavigationPageOne {
  @Consume('navStack') pageStack: NavPathStack;

  build() {
    NavDestination() {

    }.title("NavigationPageOne")
  }
}