//全局函数 给Row标记扩展属性
@AnimatableExtend(Row)
//动画属性参数必须是number类型的
function rotateAnimation(angle: number) {
  .rotate({
    angle: angle,
    centerX: 0,
    centerY: 0
  })
}


@Entry
@Component
struct AnimatableExtendCase {
  @State
  angle: number = 0

  build() {
    Column() {
      // 1.底部的容器
      Row() {
        // 2.中间旋转的盒子
        Row() {

        }
        //宽高大于外部的一半即可
        .width(120)
        .height(50)
        //旋转边的颜色
        .backgroundColor('#FFE846F8')
        .position({
          left: '50%',
          top: '50%'
        })
        //方式1
        // .rotate({
        //   angle: this.angle,
        //   centerX: 0,
        //   centerY: 0
        // })
        //方式2
        .rotateAnimation(this.angle)
        .animation({
          duration: 1000,
          iterations: -1
        })

        // 3.上边展示的内容
        Row() {
          Text('登录')
            .fontColor(Color.White)
            .fontSize(36)
            .onClick(() => {
              this.angle = 360
            })
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Blue)
            .width('100%')
        }
        .width(200)
        .height(80)
        // .backgroundColor(Color.Gray)
        .backgroundColor(Color.Blue)
        .borderRadius(12)
        //登录Text水平居中
        .justifyContent(FlexAlign.Center)
      }
      //底部的容器
      .width(206)
      .height(86)
      // .backgroundColor(Color.Black)
      .backgroundColor(Color.Transparent)
      .justifyContent(FlexAlign.Center)
      .borderRadius(12)
      //超出边界的进行裁剪
      .clip(true)
    }
    .height('100%')
    .width('100%')
  }
}