@Component
struct FirstHeaderCase {
  build() {
    Row() {
      Text('美团头部')
    }
    .width('100%')
    .height(60)
    .backgroundColor(Color.Pink)
    .justifyContent(FlexAlign.Center)
  }
}

// 默认导出
export default FirstHeaderCase