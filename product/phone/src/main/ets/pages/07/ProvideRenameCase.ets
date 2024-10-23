@Entry
@Component
struct ProvideRenameCase {
  // @Provide('newMessage') //2.给提供的数据起个别名->新提供的叫做newMessage
  // // 起了别名不影响原来的使用！！！
  // // 1.提供方还是叫message
  // message: string = 'Hello World';

  build() {
    Column() {
      // Text(this.message)
      // ProvideRenameChild()
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct ProvideRenameChild {
  // 如果没有用别名，用了原数据还是可以接受到
  // 还可以用别名接受
  // @Consume
  // message: string
  // @Consume
  // newMessage: string

  build() {
    Column() {
      //预览不了，但是模拟器两个都可以用
      // Text(this.message)
      // Text(this.newMessage)
    }
  }
}