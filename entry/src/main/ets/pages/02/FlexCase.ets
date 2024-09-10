@Entry
@Component
struct FlexCase {
  build() {
    // 弹性布局 Flex布局设置属性设置方向 是通过参数的，并非通过属性
    // Flex是一个容器组件，和Row,Column的区别是可以自动换行,默认从左往右水平排列
    // 参数：写在小括号里面的内容
    Flex({justifyContent: FlexAlign.Center, wrap: FlexWrap.Wrap}) {
      Row() {
      }
      //如果换成150，则不会均匀分布
      .width(100)
      .height(200)
      .backgroundColor(Color.Pink)

      Row() {
      }
      .width(100)
      .height(200)
      .backgroundColor(Color.Orange)

      Row() {
      }
      .width(100)
      .height(200)
      .backgroundColor(Color.Green)

      Row() {
      }
      .width(100)
      .height(200)
      .backgroundColor(Color.Blue)

      Row() {
      }
      .width(100)
      .height(200)
      .backgroundColor(Color.Yellow)
    }
    // 属性 ：组件后面.出来的内容
    .width('100%')

  }
}