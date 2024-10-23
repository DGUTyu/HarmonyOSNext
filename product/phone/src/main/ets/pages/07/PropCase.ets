@Entry
@Component
struct PropCase {
  // 父组件：
  @State
  money: number = 99999

  build() {
    Column({ space: 20 }) {
      Text('father:' + this.money)
      Button('存100块')
        .onClick(() => {
          //父组件每次变化都会同步给子组件
          this.money += 100
        })
      PropChild({
        money: this.money
      })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct PropChild {
  // 子组件：
  // 如果希望父组件更改状态，子组件同步更新：@Prop
  // @Prop只适用于单向：父改变->子跟着改变 子改变只能改自己，父组件不会同步！！！
  // @State :数据更新，UI更新 (自身，第一层)

  //@State //用这个，子改变只能改自己，父组件的变化不会同步给子组件，子组件的变化不会同步给父组件
  @Prop //用这个，子改变只能改自己，父组件的变化会同步给子组件，子组件的变化不会同步给父组件
  money: number = 0

  build() {
    Column() {
      Text('child:' + this.money)
      Button('存100块')
        .onClick(() => {
          //子组件每次变化都不会同步给父组件
          this.money += 100
        })
    }.padding(20)
    .backgroundColor(Color.Pink)
  }
}