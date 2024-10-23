@Component
  //@Component 最好不要加@Preview
struct PlayControlComp {
  @Consume
  isPlay: boolean

  build() {
    Row({ space: 20 }) {
      Image($r('sys.media.ohos_ic_public_play_last'))
        .width(20)
        .aspectRatio(1)
      Image(this.isPlay ? $r('sys.media.ohos_ic_public_pause') : $r('sys.media.ohos_ic_public_play'))
        .width(20)
        .aspectRatio(1)
        .onClick(() => {
          this.isPlay = !this.isPlay
        })
      Image($r('sys.media.ohos_ic_public_play_next'))
        .width(20)
        .aspectRatio(1)
    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }
}

export default PlayControlComp