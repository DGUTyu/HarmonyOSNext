@Entry
@Component
struct ScrollCase02 {
  // 控制器来操控滚动条
  scroller: Scroller = new Scroller()

  build() {
    /**
     * 如何控制滚动
     * Scroll的滚动一般由用户的手指触发
     * 我们也可以使用一个对象来控制滚动条 scroller
     */
    Column() {
      // 滚动区域
      Scroll(this.scroller) {
        Row({ space: 20 }) {
          Actor()
          Actor()
          Actor()
          Actor()
          Actor()
          Actor()
        }
        .backgroundColor(Color.Pink)
        .padding(20)
      }
      .width('100%')
      //   如果要改变滚动方向：scrollable
      .scrollable(ScrollDirection.Horizontal)

      //   控制按钮
      Flex({ wrap: FlexWrap.Wrap }) {
        Button('滚动到开始')
          .onClick(() => {
            // scrollEdge控制滚动位置
            this.scroller.scrollEdge(Edge.Start)
          })
        Button('滚动到结束')
          .onClick(() => {
            // scrollEdge控制滚动位置
            this.scroller.scrollEdge(Edge.End)
          })

        Button('滚动到指定坐标')
          .onClick(() => {
            // 滚动到指定坐标
            this.scroller.scrollTo({ xOffset: 400, yOffset: 0 })
          })
      }
      .width('100%')
      .margin({
        top: 30
      })

    }
  }
}

@Component
struct Actor {
  build() {
    Column() {
      Text('大话西游')
    }
    .width(140)
    .height(180)
    .backgroundColor(Color.Red)
    .borderRadius(4)
  }
}