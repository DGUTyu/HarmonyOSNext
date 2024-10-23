@Entry
@Component
struct RowColumnCase {
  build() {
    // 线性布局：
    // 口诀：从外往里 从大到小 从上往下 从左往右
    // 主轴：排列方向上的轴
    // 侧轴：垂直主轴的轴
    // Row：横向排列，垂直居中，不会自动换行
    // Column:纵向排列，水平居中，不会自动换行
    // 从上往下
    Column() {
      // 从左往右
      Row({ space: 15 }) {
        Row()
          .width(100)//vp
          .height(200)
          .backgroundColor(Color.Pink)
        Row()
          .width(100)//vp
          .height(200)
          .backgroundColor(Color.Red)
        Row()
          .width(100)//vp
          .height(200)
          .backgroundColor(Color.Blue)
      }
      .width('100%')
      .margin({
        top: 20,
        bottom: 40,
        //left:50
      })
      // 主轴方向对齐：居中
      .justifyContent(FlexAlign.Center)

      // 从上往下
      Column({ space: 15 }) {
        Row()
          .width(200)//vp
          .height(100)
          .backgroundColor(Color.Pink)
        Row()
          .width(200)//vp
          .height(100)
          .backgroundColor(Color.Red)
        Row()
          .width(200)//vp
          .height(100)
          .backgroundColor(Color.Blue)
      }
      //.width('100%')
      .backgroundColor(Color.Gray)
    }
  }
}