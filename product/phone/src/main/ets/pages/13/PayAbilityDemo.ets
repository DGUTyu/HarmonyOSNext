import { common, Want } from '@kit.AbilityKit';

@Entry
@Component
struct PayAbilityDemo {
  //此时phone的 Deploy Multi Hap 配置里要勾选payAbility
  @State message: string = '结算页面2';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('PayAbilityDemoHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })

      Button('去支付2')
        .onClick(async () => {
          //   1.跳转ability需要参数Want
          let want: Want = {
            // deviceId为空表示本设备
            deviceId: '',
            //显式拉起Ability,通过bundleName、abilityName和moduleName可以唯一确定一个Ability
            //也可以调用第三方的包，只需要知道第三方的包名即可
            bundleName: 'cn.android.harmonyosnext',
            abilityName: 'PayAbilityAbility',
            moduleName: 'payAbility',
            //传参使用parameters，它是一个object类型，你可以传递你想传的任意数据
            parameters: {
              price: Date.now()
            }
          };
          //   2.startAbility
          // getContext是获取ability中的上下文(context)
          // ability中的上下文环境(系统参数，ability参数->统称状态信息)
          // 1.在UI页面想获取ability的上下文只能通过getContext
          // 2.在ability中可以直接拿this.context
          // UIAbility才能调用.startAbility
          // (getContext() as common.UIAbilityContext).startAbility(want)
          //   启动ability(支付，类似做一件事拿结果).startAbilityForResult
          const result = await (getContext() as common.UIAbilityContext).startAbilityForResult(want)
          // 验证代码：注意debugger没问题就行，打印可能存在问题
          this.message += result.want?.parameters!['paySuccess']
          this.message += result.want?.parameters!['priceNum']
        })
    }
    .height('100%')
    .width('100%')
  }
}