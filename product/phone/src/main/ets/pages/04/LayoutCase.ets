@Entry
@Component
struct LayoutCase {
  build() {
    Column() {
      Row() {
        Text('宽高比例')
      }
      .width('100%')
      .aspectRatio(16 / 9)
      .backgroundColor(Color.Pink)

      Row() {
        // 元素占比：分配剩余空间 = （‘100%’ - 80）/ 2
        Text('姓名').width(80).backgroundColor(Color.Orange)
        TextInput()
          .border({ width: 2, color: Color.Gray })
          .width(80)
          .layoutWeight(1)
        TextInput()
          .border({ width: 2, color: Color.Gray })
          .layoutWeight(1)
      }
    }
    .width('100%')
    .height('100%')
  }
}