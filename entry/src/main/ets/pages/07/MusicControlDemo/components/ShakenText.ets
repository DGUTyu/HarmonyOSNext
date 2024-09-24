@Component
  //@Component 最好不要加@Preview
struct ShakenText {
  build() {
    Stack() {
      Text('抖音')
        .fontSize(60)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Black)
          // 通过zIndex控制堆叠层级
        .zIndex(2)
      Text('抖音')
        .fontSize(60)
        .fontWeight(FontWeight.Bold)
        .fontColor('#ff2f93ac')
        .translate({
          x: -2,
          y: -2,
        })
      Text('抖音')
        .fontSize(60)
        .fontWeight(FontWeight.Bold)
        .fontColor('#ffa118ba')
        .translate({
          // 不能和上一个的xy重复，否则就只展示一个字了！！！
          x: -4,
          y: -4
        })
    }.width('100%')
    .height(300)
  }
}

export default ShakenText