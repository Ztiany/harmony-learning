import { Config, httpRequestGet } from '../../../network/WanHttpKit';
import WanResult from '../../../network/WanResult';
import { WanArticle } from './Model';

class HttpViewModel {
  getColumnList(): Promise<WanArticle[]> {
    return new Promise((resolve: Function, reject: Function) => {
      let url = Config.makeUrl("popular/column/json");
      httpRequestGet(url).then((data: WanResult) => {
        if (data.errorCode === Config.SERVER_CODE_SUCCESS) {
          resolve(data.data);
        } else {
          reject(new Error(data.errorMsg));
        }
      }).catch(() => {
        reject(new Error("Failed to get column list"));
      });
    });
  }
}

const httpViewModel = new HttpViewModel();

export default httpViewModel as HttpViewModel