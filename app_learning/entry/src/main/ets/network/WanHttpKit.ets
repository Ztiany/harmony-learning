import { http } from '@kit.NetworkKit';
import WanResult from './WanResult';

export class Config {
  static readonly JSON = 'application/json'
  static readonly HTTP_READ_TIMEOUT: number = 10000;
  static readonly HTTP_CODE_200: number = 200;
  static readonly SERVER_CODE_SUCCESS: number = 0;
  static readonly BASE_URL = "https://www.wanandroid.com/"

  static makeUrl(path: string): string {
    return `${Config.BASE_URL}${path}`
  }
}

export function httpRequestGet(url: string): Promise<WanResult> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    readTimeout: Config.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': Config.JSON
    },
    connectTimeout: Config.HTTP_READ_TIMEOUT,
    extraData: {}
  });

  let serverData: WanResult = new WanResult();

  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === Config.HTTP_CODE_200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson: WanResult = JSON.parse(result);
      if (resultJson.errorCode === Config.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.errorCode = resultJson.errorCode;
      serverData.errorMsg = resultJson.errorMsg;
    } else {
      serverData.errorMsg = `Network request failed, please try later: ${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData.errorMsg = "Network request failed, please try later!";
    return serverData;
  })
}