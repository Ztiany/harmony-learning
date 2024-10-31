import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import AppMultitonAbility from '../../appmultitonability/AppMultitonAbility';
import { logger } from '../../utils/Logger';

const TAG: string = 'AbilityPage';

/**
 UIAbility 的启动模式是指 UIAbility 实例在启动时的不同呈现状态。针对不同的业务场景，系统提供了三种启动模式：

 - singleton（单实例模式）
 - multiton（多实例模式）【standard 是 multiton 的曾用名，效果与多实例模式一致。】
 - specified（指定实例模式）

 具体来说：

 - singleton 启动模式为单实例模式，也是默认情况下的启动模式。每次调用 startAbility() 方法时，如果应用进程中该类型的 UIAbility 实例已经存在，
 则复用系统中的 UIAbility 实例。系统中只存在唯一一个该 UIAbility 实例，即在最近任务列表中只存在一个该类型的 UIAbility 实例。
 - multiton 启动模式为多实例模式，每次调用 startAbility() 方法时，都会在应用进程中创建一个新的该类型 UIAbility 实例。即在最近任务列表中可以
 看到有多个该类型的 UIAbility 实例。这种情况下可以将 UIAbility 配置为 multiton（多实例模式）。
 - specified 启动模式为指定实例模式，针对一些特殊场景使用（例如文档应用中每次新建文档希望都能新建一个文档实例，重复打开一个已保存的文档希望打开的
 都是同一个文档实例）。需要配合 AbilityStage 的 onAcceptWant 方法进行使用，针对同一个 key，只会创建一个对应的 UIAbility 实例。
 */
@Entry
@Component
struct AbilityPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      // 打开 multiton 模式的 Ability
      Button("Open AppMultitonAbility")
        .margin(10)
        .onClick(() => {
          let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
          let want: Want = {
            deviceId: '', // deviceId 为空表示本设备
            bundleName: 'me.ztiany.harmony.app',
            abilityName: 'AppMultitonAbility',
            // parameters 为自定义信息参数
            parameters: {
              needResult: false
            }
          };
          context.startAbility(want)
            .then(() => {
              logger.i(TAG, 'Succeeded in starting AppMultitonAbility.');
            })
            .catch((err: BusinessError) => {
              logger.i(TAG, `Failed to start SpecifiedAbility. Code is ${err.code}, message is ${err.message}`);
            })
        })

      // 打开 multiton 模式的 Ability，并且获取结果
      Button("Open AppMultitonAbility for Result")
        .margin(10)
        .onClick(() => {
          let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
          let want: Want = {
            deviceId: '', // deviceId 为空表示本设备
            bundleName: 'me.ztiany.harmony.app',
            abilityName: 'AppMultitonAbility',
            // parameters 为自定义信息参数
            parameters: {
              needResult: true
            }
          };

          context.startAbilityForResult(want)
            .then((data) => {
              logger.i(TAG, 'Succeeded in starting AppMultitonAbility.');
              if (data?.resultCode == AppMultitonAbility.KEY_FOR_RESULT_CODE) {
                logger.i(TAG, `get result from AppMultitonAbility: ${data.want?.parameters &&
                data.want?.parameters["AppMultitonAbilityKey"]}`);
              }
            })
            .catch((err: BusinessError) => {
              logger.i(TAG, `Failed to start SpecifiedAbility. Code is ${err.code}, message is ${err.message}`);
            })
        })


      // 打开 specified 模式的 Ability
      Button("Open AppSpecifiedAbility")
        .margin(10)
        .onClick(() => {
          let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
          let want: Want = {
            deviceId: '', // deviceId 为空表示本设备
            bundleName: 'me.ztiany.harmony.app',
            abilityName: 'AppSpecifiedAbility',
            parameters: {
              "openId": "fixedOpenId"
            }
          };
          context.startAbility(want)
            .then(() => {
              logger.i(TAG, 'Succeeded in starting AppMultitonAbility.');
            })
            .catch((err: BusinessError) => {
              logger.i(TAG, `Failed to start SpecifiedAbility. Code is ${err.code}, message is ${err.message}`);
            })
        })


      // 打开其他应用的 UIAbility
      Button("Open Browser")
        .margin(10)
        .onClick(() => {
          let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
          let want: Want = {
            // 类型
            entities: ['entity.system.browsable'],
            // 动作
            action: 'ohos.want.action.viewData',
            // 数据
            uri: 'https://www.huawei.com/cn/'
          };
          context.startAbility(want)
            .then(() => {
              logger.i(TAG, 'Succeeded in starting AppMultitonAbility.');
            })
            .catch((err: BusinessError) => {
              this.getUIContext().getPromptAction().showToast({
                message: `${err.message}`,
                duration: 2000
              })
              logger.i(TAG, `Failed to start SpecifiedAbility. Code is ${err.code}, message is ${err.message}`);
            })
        })

    }
    .height('100%')
    .width('100%')
  }
}