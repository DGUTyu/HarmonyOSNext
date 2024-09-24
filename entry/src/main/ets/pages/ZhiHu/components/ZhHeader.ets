@Preview
@Component
struct ZhHeader {
  build() {
    Row() {
      Image($r('sys.media.ohos_ic_compnent_titlebar_back'))
        .width(40)
        .aspectRatio(1)
        .padding(6)
        .backgroundColor('#ececec')
        .borderRadius(20)
      Text('评论回复').layoutWeight(1).textAlign(TextAlign.Center)
      //图片右边
      Row() {

      }.width(40)
      .aspectRatio(1)
    }
    .padding(10)
    .width('100%')
  }
}

//导出
export default ZhHeader