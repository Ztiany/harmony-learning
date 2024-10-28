// 导入页面路由模块
import router from '@ohos.router';

export interface Entrance {
  name: string

  open(): void
}

export class PageEntrance implements Entrance {
  private route: string
  name: string

  constructor(name: string, route: string) {
    this.route = route
    this.name = name
  }

  open(): void {
    if (!this.route) {
      console.error(`The route for ${this.name} is empty`)
      return
    }

    router.pushUrl({ url: this.route })
      .then(() => {
        console.info('Succeeded in jumping to the second page.')
      })
      .catch((err: Error) => {
        console.error(`Failed to jump to the second page.Code is ${err.name}, message is ${err.message}`)
      })
  }
}
