export default class WanResult {
  /**
   * Code returned by the network request: success, fail.
   */
  errorCode: number;
  /**
   * Message returned by the network request.
   */
  errorMsg: string;
  /**
   * Data returned by the network request.
   */
  data: string | Object | ArrayBuffer;

  constructor() {
    this.errorCode = -1;
    this.errorMsg = '';
    this.data = '';
  }
}