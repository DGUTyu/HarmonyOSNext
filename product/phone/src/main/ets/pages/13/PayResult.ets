import { common } from '@kit.AbilityKit';

@Entry
@Component
struct PayResult {
  @State
  message: string = '支付页面';
  @StorageLink('orderId')
  orderId: number = 0

  build() {
    RelativeContainer() {
      Text(`当前支付订单号${this.orderId}`)
        .id('PayResultHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      Button("支付").onClick(async () => {
        //1.支付：拿到结果 记得加上await
        //2.响应
        //3.关闭自身（默认自杀是没有效果的，要在src/main/module.json5加上"removeMissionAfterTerminate": true 才可以）
        await (getContext() as common.UIAbilityContext).terminateSelfWithResult({
          resultCode: 200,
          //填写打开ability的want信息
          want: {
            bundleName: "cn.android.harmonyosnext",
            abilityName: "EntryAbility",
            parameters: {
              payRes: true,
              payResStr: '支付成功'
            }
          }
        })

      })
    }
    .height('100%')
    .width('100%')
  }
}