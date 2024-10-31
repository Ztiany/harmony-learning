import AppMultitonAbility from '../../appmultitonability/AppMultitonAbility';
import { common } from '@kit.AbilityKit';
import { logger } from '../../utils/Logger';

const TAG = "AppMultitonPage"

@Entry
@Component
struct AppMultitonPage {
  @State message: string = 'I am a page for AppMultitonAbility';

  build() {
    Column({ space: 10 }) {
      Text(this.message)
        .id('AppMultitonPageHelloWorld')
        .fontSize(50)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
        .width('80%')

      Button("Exit")
        .width('80%')
        .onClick(() => {
          const context = getContext(this) as common.UIAbilityContext;
          const needResult = LocalStorage.getShared().get<boolean>(AppMultitonAbility.KEY_FOR_NEED_RESULT)
          logger.d(TAG, `needResult = ${needResult}`)
          if (needResult) {
            let abilityResult: common.AbilityResult = {
              resultCode: AppMultitonAbility.KEY_FOR_RESULT_CODE,
              want: {
                bundleName: 'me.ztiany.harmony.app',
                abilityName: AppMultitonAbility.KEY_FOR_RESULT_ABILITY,
                parameters: {
                  AppMultitonAbilityKey: '来自 AppMultitonAbility 的数据。'
                },
              },
            };
            context.terminateSelfWithResult(abilityResult)
          } else {
            context.terminateSelf()
          }
        })
    }
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}