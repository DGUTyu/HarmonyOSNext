import { promptAction } from '@kit.ArkUI';

// 箭头函数 -> es6 -> ECMA Script
// 建议学习：数据类型，声明变量，函数，对象，数组，数组方法
// 数组的方法：新增、删除、累加求和，索引

@Entry
@Component
struct OnAreaChangeCase {
  /**
   * 组件区域变化事件
   * 尝试获取组件的大小-组件区域变化事件onAreaChange
   */

  login() {
    promptAction.showToast({
      message: '登录成功'
    })
  }

  loginToButton() {
    promptAction.showToast({
      message: '登录失败'
    })
  }

  @State message: string = 'Hello World';

  build() {
    Row() {
      // {space:20} 实参  实际的参数
      Column({ space: 20 }) {
        Image('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
          .width(160)
            // _oldValue形参  形式上的参数，可以自己起名字
          .onAreaChange((_oldValue, _newValue) => {
            //1.需要获取元素的大小
            //2.需要获取距离父元素位置的信息
            //3.好用，但是不能通篇的使用
            AlertDialog.show({
              //注意：下面的不是单引号，而是tab键上面的那个键
              //引用变量的方式是  ${变量}
              message: `height:${_newValue.height},width:${_newValue.width},x:${_newValue.position.x},y:${_newValue.globalPosition.y}`
            })
          })

        TextInput({ placeholder: '请输入用户名', text: '' })
          .height(40)
          .onChange((value) => {
            // 监听系统组件的事件的话  回调函数的参数都是有具体类型  一般的话不用给类型
            promptAction.showToast({ message: value })
          })

        TextInput({ placeholder: '请输入密码', text: '' })
          .height(40)
          .onChange((value) => {
            promptAction.showToast({ message: value })
          })
          .type(InputType.Password)
          .onSubmit(() => {
            this.login()
          })

        Button('登录').width('100%').onClick(this.loginToButton)
      }
      .padding({
        left: 20,
        right: 20
      })
      .width('100%')
    }
    .height('100%')
  }
}