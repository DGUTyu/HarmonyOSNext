@Component
struct HomePage {
  // 跳转条件
  // 2.2  接收路由控制器
  @Consume
  navStack: NavPathStack

  build() {
    Column() {
      Text('首页内容')
      //2.页面间的跳转
      Button('跳转商品页面')
        .onClick(() => {
          //     router.pushUrl
          this.navStack.pushPath({
            name: 'goodInfo'
          })
        })
      Button('跳转支付页面')
        .onClick(() => {
          // 无论如何都会新打开一个页面
          this.navStack.pushPath({
            // 必须和条件渲染的name匹配
            name: 'pay'
            //name: 'MyPay'
          })
        })
    }
  }
}

export default HomePage