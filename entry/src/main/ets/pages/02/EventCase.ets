import { promptAction } from '@kit.ArkUI'

// 组件外定义的叫全局函数，注意：组件外面的函数不能用this！！！
// 1.function关键字声明全局函数，还可以用export进行导出
export function checkUserName2() {
  promptAction.showDialog({
    message: '登录超时'
  })
}

// 2.箭头函数声明，注意：组件外面的函数不能用this！！！
const checkUserName3 = () => {
  promptAction.showDialog({
    message: '登录超时'
  })
}


@Entry
@Component
struct EventCase {
  //1.组件内部定义的函数（推荐）
  checkUserName() {
    promptAction.showDialog({
      message: '组件内部定义的函数'
    })
  }

  /**
   * 组件-事件监听
   * 监听原生组件的事件和设置属性的方式是一样的都是链式调用，
   * 值得注意的是，我们注册事件必须使用箭头函数的写法，Next版本禁止使用匿名函数的形式来给组件注册事件
   ● 匿名函数 function () {}    （ES5函数声明方式的一种，在鸿蒙中属于弃用语法）
   ● 组件外部函数 function () {}       （组件内可以使用组件外的声明的函数，但需要注意this指向）

   ● promAction.showToast()轻量级提示，需要引入一个包才可以使用的,自动消失
   ● promAction.showDialog()弹层级提示，需要引入一个包才可以使用的,点击消失
   ● AlertDialog.show() 弹层级提示，不需要引入包使用的，点击消失

   请注意：在注册事件中的逻辑必须使用箭头函数 () => {}
   1. 因为function中this指向为undefind
   2. 箭头函数中的this指向当前struct实例，可以方便的调用方法和获取属性
   当我们事件处理逻辑比较复杂，写在UI描述中无法抽提的时候，我们可以在struct结构体中定义

   关于箭头函数和this的说明：
   1.推荐使用箭头函数
   2.call和apply是错误级别不支持，bind是警告，能用也别用！
   3.this是当前上下文，一般指函数调用者
   */
  build() {
    Row() {
      Column({ space: 20 }) {
        TextInput({ placeholder: '请输入用户名' })
          .width('80%')
          .backgroundColor('#ffe7e0e0')
            // value就是每次输入后的内容
          .onChange((value) => {
            //轻提示输入框的内容
            promptAction.showToast({
              message: value
            })
          })
            //表单提交：输入框。模拟器上可以直接敲回车
            // .onSubmit(() => {
            //   //    把你要做的事直接写到箭头函数中(eg:提示)推荐
            //   // 弹层提示：1
            //   promptAction.showDialog({
            //     title: '登录提示',
            //     message: '登录超时',
            //     alignment: DialogAlignment.Bottom
            //   })
            // })

            // 箭头函数：(参数) => {
            // 函数体
            // }
            // this.checkUserName 是一个函数
            // this.checkUserName() 执行checkUserName函数
            // 下面是不推荐的写法：因为没有用箭头函数包裹，this指向可能会出问题
            // .onSubmit(this.checkUserName)

          .onSubmit(() => {
            //    1.把你要做的事直接写到箭头函数中(eg:提示)
            //    2.封装一个函数，用箭头函数包裹进行传递
            // this.checkUserName()代表执行这个函数
            this.checkUserName()
            //   3.使用全局函数(不在组件内声明的函数)
            // checkUserName2()
            //   4.使用全局箭头函数
            // checkUserName3()
          })
            // 聚焦事件
          .onFocus(() => {
            promptAction.showToast({
              message: '我聚焦了！'
            })
          })

        Button('登录')
          .width('80%')
          .onClick(() => {
            // 弹层提示：2
            AlertDialog.show({
              message: '登录失败'
            })
          })

        Text('为什么说一定要用箭头函数？')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
            //报错
            //.onClick(this.showThis)
            //推荐
          .onClick(()=>{
            this.checkUserName()
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}