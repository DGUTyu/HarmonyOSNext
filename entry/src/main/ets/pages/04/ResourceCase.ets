@Entry
@Component
struct ResourceCase {
  build() {
    Column() {
      //系统设置颜色
      //系统设置文字：国际化 -> 不同语言环境展示不同的文字
      //不要一个个目录写，然后复制到对应的语言目录
      //而是在其中一个string.json中直接打开 Open editor
      Text($r('app.string.My_Name'))
        //.width(90) 会显示...
        //切换系统语言后，文字会优先使用对应的语言。颜色值也一样
        .width(200)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .fontColor($r('app.color.forgiveColor'))
        .fontSize(50)
    }.height('100%')
    .width('100%')

  }
}