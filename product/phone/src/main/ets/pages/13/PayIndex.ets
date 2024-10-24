import { common } from '@kit.AbilityKit';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct PayIndex {
  @State message: string = '订单页面';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('PayIndexHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      Button("去支付").onClick(async () => {
        //方式1：want就是要打开的ability参数信息
        // (getContext() as common.UIAbilityContext).startAbility({
        //   //包名
        //   bundleName: "cn.android.harmonyosnext",
        //   //Ability名称
        //   abilityName: "PayAbility"
        // })

        //方式2：打开需要新的业务执行
        const result = await (getContext() as common.UIAbilityContext).startAbilityForResult({
          bundleName: "cn.android.harmonyosnext",
          abilityName: "PayAbility",
          parameters: {
            orderId: Date.now()
          }
        })
        //能正常使用
        this.message += result.want?.parameters!['payRes']
        this.message += result.want?.parameters!['payResStr']
        //但不能提示（没修复）
        promptAction.showToast({
          //但是断点或延时才会提示
          message: JSON.stringify(result)
        })

      })
    }
    .height('100%')
    .width('100%')
  }
}