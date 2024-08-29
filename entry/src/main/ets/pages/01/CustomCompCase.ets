@Entry
@Component
/**
 * 自定义组件
 */
struct MyLayout {
  build() {
    Column() {
      RowCase()
      ColumnCase()
    }
    .height('100%')
    .backgroundColor(Color.Grey)
  }
}

@Component
struct RowCase {
  build() {
    Row() {
      Column().height(150).width(100).backgroundColor(Color.Pink)
      Column().height(150).width(100).backgroundColor(Color.Red)
      Column().height(150).width(100).backgroundColor(Color.Blue)
    }
    .width('100%')
    //设置Row子元素垂直方向（Column子元素水平方向）对齐方式
    .alignItems(VerticalAlign.Top)
    //SpaceAround:相邻元件之间的距离相同。相邻元素之间距离的一半为第一个元素和最后一个元素与行末尾之间的距离。
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor(Color.Green)
  }
}

@Component
struct ColumnCase {
  build() {
    Column() {
      Column().height(100).width(150).backgroundColor(Color.Pink)
      Column().height(100).width(150).backgroundColor(Color.Red)
      Column().height(100).width(150).backgroundColor(Color.Blue)
    }
    .height(400)
    .width('100%')
    //SpaceEvenly:相邻元素之间的间距、第一元素和行开头之间的间距，并且最后一个元素和行末尾之间的间距是相同的。
    .justifyContent(FlexAlign.SpaceEvenly)
    .backgroundColor(Color.Orange)
  }
}