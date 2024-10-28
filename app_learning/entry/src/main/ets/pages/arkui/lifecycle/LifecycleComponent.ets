import { uiObserver, router, UIObserver } from '@kit.ArkUI';
import { logger } from '../../../utils/Logger'

/**
 * 在自定义组件中监听页面的生命周期。
 */
@Component
export struct LifecycleComponent {
  listener: (info: uiObserver.RouterPageInfo) => void = (info: uiObserver.RouterPageInfo) => {
    let routerInfo: uiObserver.RouterPageInfo | undefined = this.queryRouterPageInfo();
    if (info.pageId == routerInfo?.pageId) {
      if (info.state == uiObserver.RouterPageState.ON_PAGE_SHOW) {
        logger.d("LifecycleComponent", `LifecycleComponent.parent onPageShow`);
      } else if (info.state == uiObserver.RouterPageState.ON_PAGE_HIDE) {
        logger.d("LifecycleComponent", `LifecycleComponent.parent onPageHide`);
      }
    }
  }

  aboutToAppear(): void {
    let uiObserver: UIObserver = this.getUIContext().getUIObserver();
    uiObserver.on('routerPageUpdate', this.listener);
  }

  aboutToDisappear(): void {
    let uiObserver: UIObserver = this.getUIContext().getUIObserver();
    uiObserver.off('routerPageUpdate', this.listener);
  }

  build() {
    Text("I can observe my parent's lifecycle events.")
  }
}