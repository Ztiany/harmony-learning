import TargetInformation from '../view/TargetInformation';
import AddTargetDialog from '../view/AddTargetDialog';
import TargetList from '../view/TargetList';
import DataModel, { TaskItemBean } from '../viewmodel/DataModel';
import { CommonConstants } from '../common/constant/CommonConstant';
import getCurrentTime from '../common/utils/DateUtil';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct MainPage {
  @State targetData: Array<TaskItemBean> = DataModel.getData();
  @State totalTasksNumber: number = 0;
  @State completedTasksNumber: number = 0;
  @State latestUpdateDate: string = CommonConstants.DEFAULT_PROGRESS_VALUE;

  /**
   * @Provide 和 @Consume，应用于与后代组件的双向数据同步，应用于状态数据在多个层级之间传递的场景。
   * 不同于上文提到的父子组件之间通过命名参数机制传递，@Provide 和 @Consume 摆脱参数传递机制的束缚，实现跨层级传递。
   *
   * 其中 @Provide 装饰的变量是在祖先节点中，可以理解为被“提供”给后代的状态变量。@Consume 装饰的变量是在后代组件中，去“消费（绑定）”祖先节点提供的变量。
   *
   * @Provide 和 @Consume 可以通过相同的变量名或者相同的变量别名绑定，变量类型必须相同。
   */
  @Provide @Watch('onProgressChanged') overAllProgressChanged: boolean = false;

  /**
   * 自定义对话框
   */
  dialogController: CustomDialogController = new CustomDialogController({
    builder: AddTargetDialog({
      onClickOk: (value: string): void => this.saveTask(value)
    }),
    // 将 Dialog 放到底部
    alignment: DialogAlignment.Bottom,
    // 微调我位置
    offset: {
      dx: CommonConstants.DIALOG_OFFSET_X,
      dy: $r('app.float.dialog_offset_y')
    },
    customStyle: true,
    autoCancel: false
  });

  /**
   * Listening targetData.
   */
  onProgressChanged() {
    this.totalTasksNumber = this.targetData.length;
    this.completedTasksNumber = this.targetData.filter((item: TaskItemBean) => {
      return item.progressValue === CommonConstants.SLIDER_MAX_VALUE;
    }).length;
    this.latestUpdateDate = getCurrentTime();
  }

  build() {
    Column() {
      this.titleBar()

      TargetInformation({
        latestUpdateDate: this.latestUpdateDate,
        totalTasksNumber: this.totalTasksNumber,
        completedTasksNumber: this.completedTasksNumber
      })

      TargetList({
        targetData: $targetData,
        onAddClick: (): void => this.dialogController.open()
      })
        .height(CommonConstants.LIST_BOARD_HEIGHT)
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.index_background'))
  }

  @Builder
  titleBar() {
    Text($r('app.string.title'))
      .width(CommonConstants.TITLE_WIDTH)
      .height($r('app.float.title_height'))
      .fontSize($r('app.float.title_font'))
      .fontWeight(CommonConstants.FONT_WEIGHT_LARGE)
      .textAlign(TextAlign.Start)
      .margin({
        top: $r('app.float.title_margin'),
        bottom: $r('app.float.title_margin')
      })
  }

  /**
   * Save the progress value and update time after you click OK in the dialog box.
   *
   * @param taskName Latest Progress Value.
   */
  saveTask(taskName: string) {
    if (taskName === '') {
      promptAction.showToast({
        message: $r('app.string.cannot_input_empty'),
        duration: CommonConstants.TOAST_TIME,
        bottom: CommonConstants.TOAST_MARGIN_BOTTOM
      });
      return;
    }
    DataModel.addData(new TaskItemBean(taskName, 0, getCurrentTime()));
    this.targetData = DataModel.getData();
    this.overAllProgressChanged = !this.overAllProgressChanged;
    this.dialogController.close();
  }
}