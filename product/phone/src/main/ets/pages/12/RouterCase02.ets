import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct RouterCase02 {
  @State message: string = '去Router01';

  //创建时才会提示
  aboutToAppear(): void {
    // 获取路由参数
    let params = router.getParams()

    promptAction.showToast({
      //获取页面栈信息
      message: router.getLength()
    })

    promptAction.showDialog({
      message: `
          当前路由栈长度：${router.getLength()}
          当前路由传递的参数：${JSON.stringify(params)}
          当前路由页面状态：${JSON.stringify(router.getState())}
      `
    })


  }

  build() {
    Text(this.message)
      .fontSize(30)
      .onClick(() => {
        router.pushUrl({
          url: 'pages/12/RouterCase01'
        })
      })
  }
}