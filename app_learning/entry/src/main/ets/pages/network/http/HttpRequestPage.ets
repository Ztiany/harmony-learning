import { logger } from '../../../utils/Logger'
import httpViewModel from "./HttpViewModel"
import { WanArticle } from "./Model"

const TAG = "HttpRequestPage"

@Entry
@Component
struct HttpRequestPage {
  @State result: string = "Loading"

  aboutToAppear(): void {
    httpViewModel.getColumnList()
      .then((data: Array<WanArticle>) => {
        this.result = JSON.stringify(data)
        logger.i(TAG, this.result)
      })
      .catch((error: Error) => {
        logger.e(TAG, `${error}`)
      })
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Text(this.result)
    }
    .height('100%')
    .width('100%')
  }
}