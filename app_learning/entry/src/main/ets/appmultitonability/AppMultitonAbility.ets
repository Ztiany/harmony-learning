import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { logger } from '../utils/Logger';

const TAG: string = 'AppMultitonAbility';

export default class AppMultitonAbility extends UIAbility {
  /**
   * 用于和页面进行通信。
   */
  private sharedStorage = new LocalStorage()
  static readonly KEY_FOR_NEED_RESULT = "AppMultitonAbility-NeedResult"
  static readonly KEY_FOR_RESULT_CODE = 1001
  static readonly KEY_FOR_RESULT_ABILITY = "EntryAbility"

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    const needResult = want.parameters?.needResult && (want.parameters?.needResult as boolean)
    logger.i(TAG, '%{public}s', `AppMultitonAbility onCreate. needResult = ${needResult}`);
    // 用于告知页面，在退出时，需要带回数据。
    this.sharedStorage.setOrCreate(AppMultitonAbility.KEY_FOR_NEED_RESULT, needResult)
  }

  onDestroy(): void {
    logger.i(TAG, '%{public}s', 'AppMultitonAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    logger.i(TAG, '%{public}s', 'AppMultitonAbility onWindowStageCreate');

    windowStage.loadContent('pages/ability/AppMultitonPage', this.sharedStorage, (err) => {
      if (err.code) {
        logger.e(TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      logger.i(TAG, 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    logger.i(TAG, '%{public}s', 'AppMultitonAbility onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    logger.i(TAG, '%{public}s', 'AppMultitonAbility onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    logger.i(TAG, '%{public}s', 'AppMultitonAbility onBackground');
  }
}
