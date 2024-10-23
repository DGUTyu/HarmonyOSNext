@Component
struct GoodInfoPage {
  @Consume
  navStack: NavPathStack

  build() {
    // 2.4使用NavDestination包裹展示的内容
    NavDestination() {
      Column() {
        Text('商品页内容')
        Button('跳转支付页面')
          .onClick(() => {
            const param: Record<string, number> = {
              'price': 999
            }
            // 跳转携带参数
            this.navStack.pushPath({
              name: 'pay',
              param: param
            })
          })
      }
      .width('100%')
      .height(300)
      .backgroundColor(Color.Green)
    }
    .title('商品页')
    // .hideTitleBar(true)
    .backgroundColor(Color.Pink)
    .backButtonIcon($r('app.media.b'))
    // 将页面以弹层的方式展示
    .mode(NavDestinationMode.DIALOG)

    // 支持声明周期
    // .onShown()
    // .onHidden()
  }
}

export default GoodInfoPage