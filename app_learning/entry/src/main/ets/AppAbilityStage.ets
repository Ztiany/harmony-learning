import { AbilityStage, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = '[AppAbilityStage]';
const DOMAIN_NUMBER: number = 0xFF00;

export default class AppAbilityStage extends AbilityStage {
  onCreate() {
    hilog.info(DOMAIN_NUMBER, TAG, 'MyAbilityStage onCreate');
  }

  onAcceptWant(want: Want) {
    hilog.info(DOMAIN_NUMBER, TAG, 'MyAbilityStage onAcceptWant start');
    if (want && want.abilityName === 'AppSpecifiedAbility') {
      if (want.parameters) {
        return `SpecifiedAbility${want.parameters.openId}`;
      }
    }
    return '';
  }
}