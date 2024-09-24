@Entry
@Component
struct LinkCase {
  // 父组件：
  @State
  money: number = 99999

  build() {
    Column({ space: 20 }) {
      Text('father:' + this.money)
      Button('存100块')
        .onClick(() => {
          this.money += 100
        })
      LinkChild({
        money: this.money
      })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct LinkChild {
  // 使用的标准：
  // 优先参考：@State组件自己使用(不涉及接收值)  ->   @Prop只接收不修改 ->   @Link接收并修改
  // 性能提升优化点参考：值传递，引用传递(传递值，传递引用类型的值)
  // @State+@Prop  @State+@Link
  // @State(父给子只传递一次) -> @Prop(父改了子会更新) -> @Link(父改了子会更新，子改了父也会更新)
  // 子组件：
  // Link：父子组件保持同步状态(双向)父改了子更新，子改了父更新！！！
  // 和State Prop一样，数据发生改变，UI仍然会进行更新(只有自身或者第一层！！)
  // Link修饰的数据都是从父亲那来的！！！所以不能有初始值！！！
  @Link
  money: number

  build() {
    Column() {
      Text('child:' + this.money)
      Button('存100块')
        .onClick(() => {
          this.money += 100
        })
    }.padding(20)
    .backgroundColor(Color.Pink)
  }
}