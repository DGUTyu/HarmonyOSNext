@Entry
@Component
struct RelativeCase {
  @State message: string = 'Hello World';

  build() {
    /**
     * 相对布局组件，用于复杂场景中元素对齐的布局。
     需要一个参考布局的容器RelativeContainer和需要排列的若干子组件
     注意：容器的id固定为__container__，参与相对布局的容器内组件若被设备锚点，需要设置id，否则不显示

     准备一个容器RelativeContainer，内部组件通过alignRules设置对其方式
     ● 垂直方向对齐
     ○ top：设置元素上方对齐位置
     ○ bottom：设置元素下方对齐位置
     ○ center：设置元素垂直中线对齐位置
     ● 水平方向对齐
     ○ left：设置元素左侧对齐位置
     ○ right：设置元素右侧对齐位置
     ○ middle：设置元素水平中线对齐位置
     */

    // // 模板示例：水平垂直居中
    // Column() {
    //   Row() {
    //     Text(this.message)
    //       .fontSize(50)
    //   }.height('100%')
    // }.width('100%')

    RelativeContainer() {
      // 1.必须有带有大小的内容
      RelativeContainer() {
        Row()
          .width('33%')
          .aspectRatio(1)
          .backgroundColor(Color.Red)
          .alignRules({
            // __container__参考布局容器
            top: { anchor: '__container__', align: VerticalAlign.Top },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .id('row1')

        Row()
          .width('33%')
          .aspectRatio(1)
          .backgroundColor(Color.Blue)
          .alignRules({
            // 除了可以参考布局容器对齐，还可以参考子元素进行对齐，必须设置id
            center: { anchor: 'row1', align: VerticalAlign.Center },
            right: { anchor: 'row1', align: HorizontalAlign.Start }
          })

        Row()
          .width('33%')
          .aspectRatio(1)
          .backgroundColor(Color.Green)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            right: { anchor: '__container__', align: HorizontalAlign.End }
          })

        Row()
          .width('33%')
          .aspectRatio(1)
          .backgroundColor(Color.Yellow)
          .alignRules({
            //往水平走就用HorizontalAlign.Center，往垂直走就用VerticalAlign.Center
            bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
            //九宫格的第8个位置
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
            //九宫格的第4个位置
            //center: { anchor: '__container__', align: VerticalAlign.Center },
          })
      }
      .backgroundColor(Color.Pink)
      .width('60%')
      .aspectRatio(1)
      .alignRules({
        //水平 left middle right
        middle: {
          // 标记相对容器
          anchor: '__container__',
          align: HorizontalAlign.Center
        },
        //垂直  top  center bottom
        center: {
          anchor: '__container__',
          align: VerticalAlign.Center
        }
      })
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Gray)
    }
  }
}