import { common } from '@kit.AbilityKit';

@Entry
@Component
struct PayAbilityCase {
  @State message: string = '分包形式-支付页面';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('PayAbilityCaseHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      Button('分包形式-支付')
        .onClick(async () => {
          //terminateSelfWithResult处理一个结果并返回，然后关闭自己
          await (getContext() as common.UIAbilityContext).terminateSelfWithResult({
            resultCode: 200,
            want: {
              abilityName: 'EntryAbility',
              bundleName: 'cn.android.harmonyosnext',
              parameters: {
                paySuccess: true
              }
            }
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}