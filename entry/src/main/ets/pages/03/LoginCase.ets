import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct LoginCase {
  //@State
  username: string = ''
  password: string = ''

  login() {
    if (this.username === 'admin' && this.password === '123456') {
      //登录成功
      promptAction.showDialog({
        message: '登录成功'
      })
    } else {
      //登录失败
      promptAction.showDialog({
        message: '登录失败'
      })
    }
  }

  build() {
    Column({ space: 20 }) {
      TextInput({ placeholder: '账号', text: this.username })
        .width('80%')
        .onChange((value) => {
          // 事件产生的UI更新不会同步给数据，需要手动赋值，否则toast的值还是为空的
          this.username = value
          promptAction.showToast({
            message: this.username
          })
        })

      //如果username没有值，不会显示。没有@State也不会显示Text
      Text(this.username).backgroundColor(Color.Red)

      TextInput({ placeholder: '密码', text: this.password })
        .width('80%')
        .onChange((value) => {
          this.password = value
        })

      Button('登录')
        .width('80%')
        .onClick(() => {
          // 写法1：写在内部
          // 写法2：组件声明方法调用
          this.login()
        })
    }
    .height('100%')
    .width('100%')
    .padding(20)
  }
}