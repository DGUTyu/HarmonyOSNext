@Entry
@Component
struct ChildCompCase {
  @State
  money: number = 999

  build() {
    Column({ space: 10 }) {
      //     第一层组件
      Text('第一层:' + this.money)
      Button('存100元')
        .onClick(() => {
          this.money += 100
        })
      ChildCompCase02({
        money: this.money
      })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct ChildCompCase02 {
  // Prop接收的值是可以传递给子组件的！！！
  @Link
  money: number

  build() {
    Column({ space: 10 }) {
      //     第二层组件
      Text('第二层:' + this.money)
      Button('存100元')
        .onClick(() => {
          this.money += 100
        })
      ChildCompCase03({
        money: this.money
      })
    }
  }
}

@Component
struct ChildCompCase03 {
  @Link
  money: number

  build() {
    Column({ space: 10 }) {
      Text('第三层:' + this.money)
      Button('存100元')
        .onClick(() => {
          this.money += 100
        })
    }
  }
}
