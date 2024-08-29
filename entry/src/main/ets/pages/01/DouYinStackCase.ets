@Entry
@Component
struct DouYinStackCase {
  build() {
    Stack() {
      Text('抖音')
        .fontSize(60)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
          //通过zIndex控制堆叠层级
        .zIndex(2)
      Text('抖音')
        .fontSize(60)
        .fontWeight(FontWeight.Bold)
        .fontColor('#ff2f93ac')
        .fontWeight(FontWeight.Bold)
          //偏移：x往左，y往上是负数，x往右,y往下边是正数。偏移效果与Stack的宽高有关
        .translate({
          x: -2,
          y: -2,
        })
      Text('抖音')
        .fontSize(60)
        .fontWeight(FontWeight.Bold)
        .fontColor(0xa118ba)
        .fontWeight(FontWeight.Bold)
        .translate({
          x: 2,
          y: 2
        })
    }
    .width('100%')
    .height(300)
  }
}