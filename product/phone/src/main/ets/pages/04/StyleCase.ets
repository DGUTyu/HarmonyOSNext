@Entry
@Component
struct StyleCase {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 15 }) {
      Button('微信支付')
        .ButtonStyleFunc()
        .backgroundColor(Color.Green)
      Button('支付宝支付')
        .ButtonStyleFunc()
        .backgroundColor(Color.Blue)
      Button('微信支付')
        .ButtonStyleFunc()
        .backgroundColor(Color.Green)
      Button('支付宝支付')
        .ButtonStyleFunc()
        .backgroundColor(Color.Blue)
        //type 不是通用属性
        .type(ButtonType.Normal)
    }
    .height('100%')
    .width('100%')
    .padding({
      top: 20,
      bottom: 20
    })
  }
}

// @Styles可以把一个 公共样式 抽离成一个样式函数
// ButtonStyleFunc可以给任何一个组件用
// 鸡肋的点：
// 1.不允许导入导出(只能在当前页面用)
// 2.函数不允许传参数
// 3.只能写公共样式(通用属性)
@Styles
function ButtonStyleFunc() {
  .width('80%')
  .height(50)
  .borderRadius(4)
}