import { PreferencesClass } from './PreferencesClass';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct PreferenceCase {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 20 }) {
      Text('PreferenceCase')
      TextInput({ placeholder: '请输入用户名' })
      TextInput({ placeholder: '请输入密码' })
      Button('登录')
        .onClick(() => {
          //持久化登录信息！！
          // 如果登录了就展示首页
          // 使用工具的属性和方法
          // PreferencesClass.key
          // PreferencesClass.getKey()

          //   如果没登录就展示登录页
          // UI页面：页面，组件，builder
          // 获取上下文的方式：getContext()

          PreferencesClass.setToken(getContext(), PreferencesClass.defaultStore, '123456')
          router.pushUrl({
            url: 'pages/09/PreferenceResultCase'
          })
        })
    }
    .height('100%')
    .width('100%')
    .padding(20)
  }
}