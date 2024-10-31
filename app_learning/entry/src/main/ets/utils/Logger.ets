import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN_NUMBER: number = 0xFF00;

export namespace logger {

  export function d(tag: string, format: string, ...args: string[]) {
    hilog.debug(DOMAIN_NUMBER, tag, format, args);
  }

  export function i(tag: string, format: string, ...args: string[]) {
    hilog.info(DOMAIN_NUMBER, tag, format, args);
  }

  export function w(tag: string, format: string, ...args: string[]) {
    hilog.info(DOMAIN_NUMBER, tag, format, args);
  }

  export function e(tag: string, format: string, ...args: string[]) {
    hilog.error(DOMAIN_NUMBER, tag, format, args);
  }

}

class Logger {
  private domain: number;
  private prefix: string;
  private format: string = '%{public}s, %{public}s';

  constructor(prefix: string) {
    this.prefix = prefix;
    this.domain = DOMAIN_NUMBER;
  }

  /**
   * Outputs debug-level logs.
   *
   * @param args Indicates the log parameters.
   */
  d(...args: string[]) {
    hilog.debug(this.domain, this.prefix, this.format, args);
  }

  /**
   * Outputs info-level logs.
   *
   * @param args Indicates the log parameters.
   */
  i(...args: string[]) {
    hilog.info(this.domain, this.prefix, this.format, args);
  }

  /**
   * Outputs warning-level logs.
   *
   * @param args Indicates the log parameters.
   */
  w(...args: string[]) {
    hilog.warn(this.domain, this.prefix, this.format, args);
  }

  /**
   * Outputs error-level logs.
   *
   * @param args Indicates the log parameters.
   */
  e(...args: string[]) {
    hilog.error(this.domain, this.prefix, this.format, args);
  }
}

export default new Logger('[AppLearning]');