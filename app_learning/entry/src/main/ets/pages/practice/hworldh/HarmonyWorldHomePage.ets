import { Article, Banner, buildBannerList, buildEnablementList, buildTutorialList } from './Data';

@Entry
@Component
struct HarmonyWorldHomePage {
  @State title: string = '快速入门';
  @State enablementTitle: string = '赋能组件';
  @State tutorialTitle: string = '入门教程';
  @State bannerList: Array<Banner> = buildBannerList()
  @State enablementList: Array<Article> = buildEnablementList()
  @State tutorialList: Array<Article> = buildTutorialList()

  build() {
    Column() {
      this.TitleWidget()
      Scroll() {
        Column() {
          this.BannerWidget()
          this.EnablementWidget()
          this.TutorialWidget()
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }

  @Builder
  TitleWidget() {
    Text(this.title)
      .fontSize(24)
      .fontWeight(700)
      .fontFamily('HarmonyHeiTi-Bold')
      .margin({ top: 15 })
  }

  @Builder
  BannerWidget() {
    Swiper() {
      ForEach(this.bannerList, (banner: Banner, index: number) => {
        Image(banner.imageSrc)
          .objectFit(ImageFit.Contain)
          .width("100%")
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16)
      }, (banner: Banner) => banner.id)
    }
    .autoPlay(true)
    .loop(true)
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7')
    )
  }

  @Builder
  EnablementWidget() {
    Column() {
      Text(this.enablementTitle)
        .fontSize(20)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-Bold')
        .margin({ left: 16 })
        .width("100%")
        .textAlign(TextAlign.Start)

      Grid() {
        ForEach(
          this.enablementList,
          (article: Article) => {
            GridItem() {
              this.EnablementItemWidget(article)
            }
          },
          (article: Article) => article.id
        )
      }
      .margin({ top: 10 })
      .rowsTemplate("1fr")
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
      .padding({ top: 2, left: 16, right: 16 })
    }
    .margin({ top: 20 })
  }

  @Builder
  EnablementItemWidget(article: Article) {
    Column() {
      Image(article.imageSrc)
        .objectFit(ImageFit.Cover)
        .height(96)
        .borderRadius({
          topLeft: 16,
          topRight: 16
        })

      Text(article.title)
        .height(19)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .fontWeight(400)
        .padding({ left: 12, right: 12 })
        .margin({ top: 8 })

      Text(article.brief)
        .height(32)
        .width('100%')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0, 0, 0, 0.6)')
        .padding({ left: 12, right: 12 })
        .margin({ top: 2 })
    }
    .width(160)
    .height(169)
    .borderRadius(16)
    .backgroundColor(Color.White)
  }

  @Builder
  TutorialWidget() {
    Column() {
      Text(this.tutorialTitle)
        .fontSize(20)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-Bold')
        .margin({ left: 16 })
        .width("100%")
        .textAlign(TextAlign.Start)

      ForEach(this.tutorialList,
        (article: Article) => {
          this.TutorialItemWidget(article)
        },
        (article: Article) => article.id)

    }
    .margin({ top: 20, bottom: 20 })
  }

  @Builder
  TutorialItemWidget(article: Article) {
    Row() {
      Column() {
        Text(article.title)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(400)
          .margin({ top: 4 })

        Text(article.brief)
          .width('100%')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0, 0, 0, 0.6)')
          .margin({ top: 5 })
      }
      .height('100%')
      .layoutWeight(1)
      .margin({ right: 12 })
      .justifyContent(FlexAlign.SpaceBetween)

      Image(article.imageSrc)
        .height("100%")
        .width(108)
        .objectFit(ImageFit.Cover)
        .borderRadius(16)
    }
    .width('100%')
    .height(88)
    .borderRadius(16)
    .backgroundColor(Color.White)
    .padding(12)
    .margin({ top: 10 })
  }
}