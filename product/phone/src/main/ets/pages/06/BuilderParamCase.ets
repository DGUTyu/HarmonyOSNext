@Entry
@Component
struct BuilderParamCase {
  /**
   * 构建函数-@BuilderParam  传递UI
   * 插槽-Vue-Slot React-RenderProps
   * ● 把UI结构体的函数(Builder修饰的函数)当成参数传入到组件中，让组件放入固定的位置去渲染
   * ● 子组件接收传入的函数的修饰符/装饰器叫做BuilderParam
   *
   * ● Component可以抽提组件
   * ● Builder可以实现轻量级的UI复用
   *  完善了吗？ 其实还不算，比如如何实现定制化Header？
   *
   * 使用BuilderParam的步骤
   * ● 前提：需要出现父子组件的关系
   * ● 前提：BuilderParam应出现在子组件中
   * ● 1. 子组件声明  @BuilderParam  getConent: () => void
   * ● 2. BuilderParam的参数可以不给初始值，如果给了初始值， 就是没有内容的默认内容
   * ● 3. 父组件传入的时候，它需要用builder修饰的函数又或者是 一个箭头函数中包裹着
   * ● 4. 调用builder函数的逻辑
   */

  @Builder
  leftContent() {
    Text('返回')
  }

  build() {
    Column({ space: 5 }) {
      //写法1 不带括号是函数，带括号是执行函数
      BuilderParamChild({
        leftContent: this.leftContent, rightContent: this.leftContent
      })
      //写法2  传递函数要怎么样？(特性：传递buildParam的时候可以包括一层箭头函数，即使箭头函数不是builder)
      BuilderParamChild({
        leftContent: () => {
          this.leftContent()
        },
        rightContent: () => {
          this.leftContent()
        }
      })

    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct BuilderParamChild {
  @Builder
  // defaultLeft就是leftContent的默认值
  defaultLeft() {
    Image($r('sys.media.ohos_ic_compnent_titlebar_back'))
      .width(24)
      .aspectRatio(1)
  }

  // 属性方法
  // @BuilderParam修饰的属性函数，初始值(赋值)只能给builder函数！！！
  @BuilderParam
  leftContent: () => void = this.defaultLeft
  //只声明不给初始值，预览会报错。
  //如果组件定义的时候没给默认值：规范应该加上参数必传！！！
  @BuilderParam
  // 限制必传！！！
  @Require
  rightContent: () => void = this.defaultLeft

  build() {
    Row() {
      this.leftContent()
      Text('最新推荐🔥').layoutWeight(1).textAlign(TextAlign.Center)
      //只声明不给初始值，预览会报错
      //this.rightContent()

      //使用时的一个保险的方法
      // if (this.rightContent) {
      //   this.rightContent()
      // }

      this.rightContent()
      // Image($r('sys.media.ohos_ic_public_scan'))
      //   .width(24)
      //   .aspectRatio(1)
    }.width('100%')
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}