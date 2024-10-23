@Entry
@Component
struct GridCase {
  build() {
    /**
     * Grid 网格布局
     ● 想要控制屏幕的分栏 分几列， 怎么分 特别像前端的栅格布局
     ● Row组件默认情况下，里面的元素的纵向是居中的
     ● Column组件默认横向是居中的

     Grid组件下只能放置GridItem组件
     Grid可以设置columnsTemplate和rowsTemplate
     columnsTemplate是设置横向的分配，如果设置 1fr 1fr 表示，等分为两份，
     如果设置1fr 2fr表示左边一份，右边两份，
     在设置columnsTemplate不设置rowsTemplate的情况下，如果内容超出容器区域，会自动出现滚动条
     columnsGap设置列和列之间的间距，rowsGap设置行和行之间的间距
     */
    Grid() {
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
    }
    .width('100%')
    .height('100%')
    //列的模板，分为几列  每列占几份
    .columnsTemplate('1fr 1fr 2fr')
    // 分为几行
    // .rowsTemplate('1fr 1fr')
    //行间距
    .rowsGap(10)
    //列间距
    .columnsGap(10)
    .padding(10)
  }
}

@Component
struct GridItemCase {
  build() {
    GridItem() {
      Row() {
        Column() {
          Text('内容')
        }
        .width('100%')
      }
      .height(200)
      .borderRadius(4)
      .backgroundColor(Color.Pink)
    }
  }
}