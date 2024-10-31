/**
 * 具体参考：<https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101717497640610394>
 */
@Entry
@Component
struct TabsPage {
  build() {
    Tabs() {
      TabContent() {
        Text('首页的内容').fontSize(30)
      }
      .tabBar("首页")

      TabContent() {
        Text('消息的列表').fontSize(30)
      }
      .tabBar("消息")

      TabContent() {
        Text('我的的内容').fontSize(30)
      }
      .tabBar("我的")
    }
  }
}