import UIAbility from '@ohos.app.ability.UIAbility';
import Window from '@ohos.window';
import Logger from '../common/utils/Logger';
import CommonConstants from '../common/constants/CommonConstants';

/**
 * Lift cycle management of Ability.
 */
export default class EntryAbility extends UIAbility {
  onWindowStageCreate(windowStage: Window.WindowStage) {
    // Main window is created, set main page for this ability.
    windowStage.loadContent('pages/HomePage', (err, data) => {
      if (err.code) {
        Logger.error(CommonConstants.TAG_ABILITY, 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      Logger.info(CommonConstants.TAG_ABILITY, 'Succeeded to load the content. Data: ' + JSON.stringify(data));
    });
  }
}
