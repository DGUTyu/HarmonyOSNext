//枚举
enum MyButtonType {
  Wechat = 'wechat',
  Alipay = 'alipay'
}


@Entry
@Component
struct ExtendCase {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 15 }) {
      Button('微信支付')
        .MyButtonExtendFunc(MyButtonType.Wechat)
      Button('支付宝支付')
        .MyButtonExtendFunc(MyButtonType.Alipay)
      Button('微信支付')
        .MyButtonExtendFunc(MyButtonType.Wechat)
      Button('支付宝支付')
        .MyButtonExtendFunc(MyButtonType.Alipay)//type 不是通用属性
        .type(ButtonType.Normal)
      Button('支付宝支付')
        .MyButtonExtendFunc(MyButtonType.Alipay)
        //样式可以覆盖
        .backgroundColor(Color.Pink)
        //圆角矩形
        .type(ButtonType.Capsule)
    }
    .height('100%')
    .width('100%')
    .padding({
      top: 20,
      bottom: 20
    })
  }
}

// 只给某个组件进行样式拓展@Extend
// 鸡肋点：不允许导入导出，只能给某一类组件拓展（给Button拓展的不能给Text用）
@Extend(Button)
function MyButtonExtendFunc(type: MyButtonType) {
  .width('80%')
  .height(50)
  .borderRadius(4)
  .type(ButtonType.Normal)
  // 三元表达式：    表达式？成立：不成立
  //.backgroundColor(type === 'wechat' ? Color.Green : Color.Blue)
  .backgroundColor(type === MyButtonType.Wechat ? Color.Green : Color.Blue)
}