/**
 * 演示 emitter 和 eventHub 的使用，参考
 *    <https://developer.huawei.com/consumer/cn/doc/harmonyos-faqs-V5/faqs-ability-68-V5>。
 */
import { common } from '@kit.AbilityKit';
import EntryAbility from '../../entryability/EntryAbility';

@Entry
@Component
struct EventPage {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 20 }) {
      Button("send event by EventHub")
        .width("40%")
        .type(ButtonType.Normal)
        .onClick(() => {
          (getContext(this) as common.UIAbilityContext).eventHub.emit(
            EntryAbility.UI_EVENT,
            "Event from EventPage"
          )
        })
    }
    .padding(10)
    .height('100%')
    .width('100%')
  }
}