@Entry
@Component
struct ConsumeRenameCase {
  @Provide
  message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
      ConsumeRenameChild()
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct ConsumeRenameChild {
  @Consume('message') //1.用于标记接收的原数据名称
  // 2.重新起一个名称用于表示接受的数据
  newMessage: string
  @State
  message: string = 'ConsumeRenameChild'

  build() {
    Column() {
      Text(this.message)
      Text(this.newMessage)
    }
  }
}