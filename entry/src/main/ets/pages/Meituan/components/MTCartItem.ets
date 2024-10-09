@Component
struct MTCartItem {
  build() {
    Row() {
      Image('https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/4.jpeg')
        .width(60)
        .aspectRatio(1)
        .borderRadius(8)
      Column({ space: 5 }) {
        Text('小份酸汤莜面鱼鱼+肉夹馍套餐')
          .fontSize(14)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(2)
        Row() {
          Text() {
            Span('¥ ')
              .fontColor($r("app.color.font_main_color"))
              .fontSize(10)
            Span('34.23')
              .fontColor($r("app.color.font_main_color"))
              .fontWeight(FontWeight.Bold)
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, right: 10 })
    }
    .alignItems(VerticalAlign.Top)
  }
}

export default MTCartItem