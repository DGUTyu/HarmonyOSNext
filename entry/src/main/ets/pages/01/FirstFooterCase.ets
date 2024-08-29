@Component
struct FirstFooterCase {
  build() {
    Row() {
      Text('美团底部').fontColor(Color.White)
    }
    .width('100%')
    .height(60)
    .backgroundColor(Color.Blue)
    .justifyContent(FlexAlign.Center)
  }
}

export default FirstFooterCase