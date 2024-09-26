@Entry
@Component
struct RequireCase {
  /**
   * Require修饰符
   * 4.0的编辑器中- 如果子组件定义了Prop，那么父组件必须得传，不传则报错
   * Next版本中，如果你想让父组件必须传递一个属性给你的Prop，作为强制性的约束条件，可以使用Require修饰符
   *
   * Require修饰符只能作用在两个修饰符前面Prop  BuilderParam
   */
  @State
  message: string = 'Hello World';

  @Builder
  parentContent() {
    Text('builderParam')
  }

  build() {
    Row() {
      Column() {
        RequireChild({
          message: this.message,
          defaultContent: () => {
            this.parentContent()
          }
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct RequireChild {
  // 1.Prop
  @Require
  @Prop
  message: string

  @Builder
  defaultChildRow() {
    Text('defaultChildRow')
  }

  // 2.BuilderParam
  @Require
  @BuilderParam
  //defaultContent: () => void
  defaultContent: () => void = this.defaultChildRow

  build() {
    Column() {
      Text(this.message)
      this.defaultContent()
    }
  }
}