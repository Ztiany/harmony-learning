import { AbilityConstant, AbilityStage, Configuration, Want } from '@kit.AbilityKit';
import { logger } from './utils/Logger';

const TAG = '[AppAbilityStage]';

export default class EntryAbilityStage extends AbilityStage {
  /*
  * 在开始加载对应 Module 的第一个 UIAbility 实例之前会先创建 AbilityStage，
  * 并在 AbilityStage 创建完成之后执行其 onCreate() 生命周期回调。
  *
  * AbilityStage 模块提供在 Module 加载的时候，通知开发者，可以在此进行该 Module
  * 的初始化（如资源预加载，线程创建等）能力。
  */
  onCreate() {
    logger.i(TAG, 'EntryAbilityStage onCreate')
  }

  /*
   * UIAbility 指定实例模式（specified）启动时候触发的事件回调。
   */
  onAcceptWant(want: Want) {
    logger.i(TAG, 'EntryAbilityStage onAcceptWant')
    if (want && want.abilityName === 'AppSpecifiedAbility') {
      // 返回的字符串用于作为 AppSpecifiedAbility 实例的唯一标识。
      if (want.parameters) {
        return `SpecifiedAbility${want.parameters.openId}`;
      }
    }
    return '';
  }

  /*
   * 当系统全局配置发生变更时触发的事件，系统语言、深浅色等，配置项目前均定义在 Configuration 类中。
   */
  onConfigurationUpdate(newConfig: Configuration): void {

  }

  onNewProcessRequest(want: Want): string {
    return super.onNewProcessRequest(want);
  }

  /*
   * 当系统调整内存时触发的事件。
   */
  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    super.onMemoryLevel(level);
  }

  onDestroy(): void {
    super.onDestroy();
  }
}