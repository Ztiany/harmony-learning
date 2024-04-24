import { CommonConstants } from '../common/constant/CommonConstant';
import getCurrentTime from '../common/utils/DateUtil';
import DataModel, { TaskItemBean } from '../viewmodel/DataModel';
import ProgressEditPanel from './ProgressEditPanel';

@Component
export default struct TargetListItem {
  private taskItem?: TaskItemBean;
  @State latestProgress?: number = 0;
  @State updateDate?: string = '';
  @Link selectArr: Array<boolean>;
  @Prop isEditMode: boolean;
  @Link @Watch('onClickIndexChanged') clickIndex: number;
  @State isExpanded: boolean = false;
  @Consume overAllProgressChanged: boolean;
  @State sliderMode: number = CommonConstants.DEFAULT_SLIDER_MODE;
  public index: number = 0;

  aboutToAppear() {
    this.latestProgress = this.taskItem?.progressValue;
    this.updateDate = this.taskItem?.updateDate;
  }

  /**
   * Listening click index.
   */
  onClickIndexChanged() {
    if (this.clickIndex !== this.index) {
      this.isExpanded = false;
    }
  }

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Column() {
        // 条目
        this.TargetItem()

        // 进度
        if (this.isExpanded) {
          Blank()
          ProgressEditPanel({
            slidingProgress: this.latestProgress,
            onCancel: () => this.isExpanded = false,
            onClickOK: (progress: number): void => {
              this.latestProgress = progress;
              this.updateDate = getCurrentTime();
              let result = DataModel.updateProgress(this.index, this.latestProgress, this.updateDate);
              if (result) {
                this.overAllProgressChanged = !this.overAllProgressChanged;
              }
              this.isExpanded = false;
            },
            sliderMode: $sliderMode
          })
            .transition({
              scale: {
                x: CommonConstants.TRANSITION_ANIMATION_X,
                y: CommonConstants.TRANSITION_ANIMATION_Y
              }
            })
        }
      }
      .padding({
        left: $r('app.float.list_padding'),
        top: $r('app.float.list_padding_top'),
        bottom: $r('app.float.list_padding_bottom'),
        right: this.isEditMode ? $r('app.float.list_edit_padding') : $r('app.float.list_padding')
      })
      .height(this.isExpanded ? $r('app.float.expanded_item_height') : $r('app.float.list_item_height'))
      .width(CommonConstants.FULL_WIDTH)
      .opacity(this.latestProgress === CommonConstants.SLIDER_MAX_VALUE ? CommonConstants.OPACITY : CommonConstants.NO_OPACITY)
      .borderRadius(CommonConstants.LIST_RADIUS)
      .animation({ duration: CommonConstants.DURATION })
      .backgroundColor(this.selectArr[this.index] ? $r('app.color.edit_blue') : Color.White)
      .onClick(() => {
        // 如果点击的是子组件 ProgressEditPanel 内部的 Slider，就不执行自身的缩放或扩展。
        // 【这里说明 ProgressEditPanel 内部的 Slider 并不会完全终止掉点击事件的传递。 】
        if (this.sliderMode === CommonConstants.CLICK_SLIDER_MODE) {
          this.sliderMode = CommonConstants.DEFAULT_SLIDER_MODE;
          return;
        }
        if (!this.isEditMode) {
          animateTo({ duration: CommonConstants.DURATION }, () => {
            this.isExpanded = !this.isExpanded;
          })
          this.clickIndex = this.index;
        }
      })

      if (this.isEditMode) {
        Row() {
          Checkbox()
            .select(this.selectArr[this.index])
            .selectedColor($r('app.color.main_blue'))
            .width(CommonConstants.CHECKBOX_WIDTH)
            .margin({ right: $r('app.float.list_padding') })
            .onChange((isCheck: boolean) => {
              this.selectArr[this.index] = isCheck;
            })
        }
        .width(CommonConstants.FULL_WIDTH)
        .justifyContent(FlexAlign.End)
      }
    }
    .width(CommonConstants.FULL_WIDTH)
  }

  @Builder TargetItem() {
    Row() {
      Text(this.taskItem?.taskName)
        .fontSize($r('app.float.list_font'))
        .fontWeight(CommonConstants.FONT_WEIGHT)
        .fontColor($r('app.color.title_black_color'))
        .width(CommonConstants.TASK_NAME_WIDTH)
        .textAlign(TextAlign.Start)
        .maxLines(CommonConstants.MAX_LINES)
      Blank()
      Column() {
        Text(`${this.latestProgress}%`)
          .fontSize($r('app.float.list_font'))
          .fontWeight(CommonConstants.FONT_WEIGHT)
          .fontColor($r('app.color.title_black_color'))
        Row() {
          Text($r('app.string.latest_updateTime'))
            .opacityTextStyle()
          Text(this.updateDate)
            .opacityTextStyle()
        }
        .margin({ top: $r('app.float.text_margin') })
      }
      .alignItems(HorizontalAlign.End)
    }
    .width(CommonConstants.FULL_WIDTH)
  }
}

/**
 * Custom transparent text styles.
 */
@Extend(Text) function opacityTextStyle() {
  .fontSize($r('app.float.text_font'))
  .fontColor($r('app.color.title_black_color'))
  .opacity(CommonConstants.OPACITY)
  .fontWeight(CommonConstants.FONT_WEIGHT)
}