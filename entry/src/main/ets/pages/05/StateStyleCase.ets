@Entry
@Component
struct StateStyleCase {
  /**
   * stateStyles（又称为：多态样式）
   * @Styles和@Extend仅仅应用于静态页面的样式复用，stateStyles可以依据组件的内部状态的不同，快速设置不同样式。
   * ArkUI 提供以下五种状态：
   * ● focused：获焦态。
   * ● normal：正常态。
   * ● pressed：按压态。
   * ● disabled：不可用态。
   * ● selected: 选中态(瞬间效果，比较少用)
   */
  @State
  canUse: boolean = true

  build() {
    Column({ space: 10 }) {
      Row() {
        Text('今天你吃饭了吗')
      }.fullWFunc()
      .padding(20)
      .backgroundColor('red')
      //注意点：stateStyles只能写公共样式
      .stateStyles({
        //1.按压状态的样式
        pressed: {
          //.backgroundColor('#ccc')
          .PressedFunc()
        },
        //2.正常状态的样式:组件自带的样式就是我的normal样式，也可以在外面写。
        //如果里面和外面都没有normal状态，则点击了会一直保持pressed状态的样式
        //组件自带的样式就是我的normal样式
        // normal: {
        //   .backgroundColor('#fff')
        // },
      })

      Text('今天你吃饭了吗2')
        .backgroundColor(Color.Blue)
        .PressedFunc2()
        .fullWFunc()

      Button('启用/禁用')
        .stateStyles({
          disabled: {
            .backgroundColor(Color.Gray)
          }
        })
        .enabled(this.canUse)
        .onClick(() => {
          this.canUse = !this.canUse
        })

      // 坑点：focused状态在模拟器和预览器上只能通过tab按键激活
      TextInput({ text: '聚焦状态' })
        .stateStyles({
          normal: {
            .border({
              width: 2,
              color: Color.Blue
            })
          },
          focused: {
            .border({
              width: 2,
              color: Color.Red
            })
          }
        })

      Row() {
        Text('Selected状态：')
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .backgroundColor(Color.Blue)
          .stateStyles({
            selected: {
              .backgroundColor(Color.Red)
            }
          })
      }

      Checkbox()
        .stateStyles({
          // 比较鸡肋用的很少，只有一刹那会有状态
          selected: {
            .backgroundColor(Color.Red)
          }
        })

    }.fullW_HFunc()
    .padding(10)
  }
}


@Styles
function fullW_HFunc() {
  .width('100%')
  .height('100%')
}

@Styles
function fullWFunc() {
  .width('100%')
}

@Styles
function PressedFunc() {
  .backgroundColor('#ffd')
}

@Styles
function PressedFunc2() {
  .stateStyles({
    pressed: {
      //stateStyles只能写公共样式
      .backgroundColor('#ffd')
      //.PressedFunc() //不可以这样写，Property 'PressedFunc' does not exist on type 'CommonAttribute'.
    }
  })
}