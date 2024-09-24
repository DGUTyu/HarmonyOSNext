@Entry
@Component
struct BuilderCase02 {
  /**
   * 构建函数参数传递规则
   * 在@Builder修饰的函数内部，不允许改变参数值
   * 只有传入一个参数，且参数需要直接传入对象字面量才会按引用传递该参数，其余传递方式均为按值传递
   */
  @State
  loginForm: LoginForm = {
    name: '张三',
    age: '18',
    bank: '中国银行',
    money: '999999'
  }

  @Builder
  // 无状态组件：不涉及修改状态
  // 100版本是可以实现双向数据绑定的
  // 原则：builder内部不能修改传递进来的数据
  // 引用传递
  FormBuilder2(loginFormData: LoginFormData) {
    TextInput({ text: loginFormData.data.name })
    TextInput({ text: loginFormData.data.age })
    TextInput({ text: loginFormData.data.bank })
    TextInput({ text: loginFormData.data.money })
  }

  //值传递
  @Builder
  FormBuilder(loginForm: LoginForm) {
    TextInput({ text: loginForm.name })
    TextInput({ text: loginForm.age })
    TextInput({ text: loginForm.bank })
    TextInput({ text: loginForm.money })
  }

  build() {
    Column({ space: 15 }) {
      //之前的开发方式是没有任何问题的！
      // TextInput({ text: '' })
      // TextInput({ text: '' })
      // TextInput({ text: '' })
      // TextInput({ text: '' })
      this.FormBuilder(this.loginForm)

      //对象字面量：{}
      this.FormBuilder2({
        data: this.loginForm
      })

      Row({ space: 15 }) {
        Button('重置')
          .onClick(() => {
            // 1.@State数据更新UI更新  2.改的是数据的第一层
            // 此时会发现，点击并不能进行UI的更新(值传递方式)
            this.loginForm.name = ''
          })
        Button('注册')
          .onClick(() => {

          })
      }.width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .padding(20)
    .height('100%')
    .width('100%')
  }
}

interface LoginForm {
  name: string
  age: string
  bank: string
  money: string
}

interface LoginFormData {
  data: LoginForm
}