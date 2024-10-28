// 导入页面路由模块
import { Entrance, PageEntrance } from '../../entrance/Entrance'

export function buildEntrance(): Array<Entrance> {
  return [
    new PageEntrance("组件及其状态", "pages/arkui/ArkUIMainPage"),
    new PageEntrance("自适应与响应式布局", "pages/arkui/ArkUIMainPage"),
    new PageEntrance("Page Architecture", "pages/arkui/ArkUIMainPage"),
    new PageEntrance("网络技术应用", "pages/network/NetworkPage"),
    new PageEntrance("数据持久化", "pages/network/NetworkPage"),
    new PageEntrance("多媒体技术", "pages/network/NetworkPage"),
    new PageEntrance("Ability 交互", "pages/ability/AbilityPage"),
    new PageEntrance("Practice Demo", "pages/practice/PracticePage")
  ]
}