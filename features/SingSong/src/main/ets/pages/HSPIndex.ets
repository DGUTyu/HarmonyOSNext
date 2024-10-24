import { promptAction, router } from '@kit.ArkUI';

@Entry({ routeName: 'hsp_test' })
@Component
export struct HSPIndex {
  //要在phone的设置里勾选 Deploy Multi Hap
  @State message: string = 'HSP_index page';

  //创建时才会提示
  aboutToAppear(): void {
    // 获取路由参数
    let params = router.getParams()

    promptAction.showDialog({
      message: `当前路由传递的参数：${JSON.stringify(params)}`
    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}