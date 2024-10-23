@Entry
@Component
struct ScrollCase {
  build() {
    /**
     * 滚动条说明
     * 在基本的布局组件 Column/Row/Flex/Stack中不论内容超出与否，皆不会出现滚动条
     ● 出现滚动条的组件
     ● Grid
     ● List(列表)
     ● Scroll(滚动条)
     ● Swiper(轮播)
     ● WaterFlow(瀑布流)
     出现滚动条的前提条件是- 上述组件中的子组件的内容超出了父容器组件的宽度或者高度

     使用最基本的Scroll组件出现一个滚动条。Scroll组件只能有一个根布局
     */

    //一般用Column作为根节点
    Column() {
      Row().width('100%')
        .height(50)
        .backgroundColor(Color.Red)

      // Column() {
      //
      // }.width('100%')
      // //.height(50)
      // .layoutWeight(1)
      // .backgroundColor(Color.Orange)

      // 作用：只能形成滚动区域
      Scroll() {
        // 形成滚动条的条件：
        // 1.具备大小的scroll组件
        // 2.内容要超出scroll大小
        Column({space:20}) {
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
        }.width('100%')
        .backgroundColor(Color.Orange)
      }.layoutWeight(1)

      Row().width('100%')
        .height(50)
        .backgroundColor(Color.Blue)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height('100%')

  }
}

@Component
struct ScrollItem {
  build() {
    // Row() {
    //   Text('滚动区域内容')
    // }
    // .width('100%')
    // .height(80)
    // .backgroundColor(Color.Pink)
    // .borderRadius(8)
    // .margin({
    //   top: 20,
    //   bottom: 10
    // })
    // .justifyContent(FlexAlign.Center)

    // 布局切记不要出现没必要的嵌套
    Text('滚动区域内容')
      .width('100%')
      .height(80)
      .backgroundColor(Color.Pink)
      .textAlign(TextAlign.Center)
  }
}