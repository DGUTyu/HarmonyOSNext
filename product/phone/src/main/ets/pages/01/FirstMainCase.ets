@Component
struct FirstMainCase {
  build() {
    Column() {
      Text('美团中部')
    }
    .width('100%')
    // 自适应：占用剩余空间比例
    .layoutWeight(1)
    .backgroundColor(Color.Green)
    //.justifyContent(FlexAlign.Center) //居中
    .alignSelf(ItemAlign.Start) //顶部居中
  }
}

export default FirstMainCase