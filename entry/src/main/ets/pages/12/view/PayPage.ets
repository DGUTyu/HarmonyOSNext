@Builder
function PayPageBuilder(){
  //虽然Builder不能直接放自定义组件，但是这里可以
  PayPage()
}


@Component
struct PayPage {
  @Consume
  navStack: NavPathStack

  // 获取跳转参数
  aboutToAppear(): void {
    // name就是跳转的name
    AlertDialog.show({
      //获取跳转页面参数
      message: JSON.stringify(this.navStack.getParamByName('pay'))
    })
  }

  build() {
    // 2.4使用NavDestination包裹展示的内容
    NavDestination() {
      Column() {
        Text('支付页内容')
        Button('返回')
          .onClick(() => {
            this.navStack.removeByIndexes([this.navStack.size() - 1])
          })
      }
    }
  }
}

export default PayPage