import { PreferencesClass } from './PreferencesClass';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct PreferenceResultCase {
  @State message: string = '登录成功！！';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('PreferenceResultCaseHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Button('退出登录')
        .onClick(() => {
          PreferencesClass.setToken(getContext(), PreferencesClass.defaultStore, '')
          router.back()
        })
    }
    .height('100%')
    .width('100%')
  }
}