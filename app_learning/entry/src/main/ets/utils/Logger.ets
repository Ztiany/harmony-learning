import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER: number = 0xFF00;
const DEFAULT_TAG: string = "AppLogger";

export namespace logger {

  export function d(tag: string = DEFAULT_TAG, format: string, ...args: object[]) {
    hilog.debug(DOMAIN_NUMBER, tag, format, args);
  }

  export function i(tag: string = DEFAULT_TAG, format: string, ...args: object[]) {
    hilog.info(DOMAIN_NUMBER, tag, format, args);
  }

  export function w(tag: string = DEFAULT_TAG, format: string, ...args: object[]) {
    hilog.info(DOMAIN_NUMBER, tag, format, args);
  }

  export function e(tag: string = DEFAULT_TAG, format: string, ...args: object[]) {
    hilog.error(DOMAIN_NUMBER, tag, format, args);
  }

}