@Component
struct ConsumeCase {
  // @Consume用于接收数据 (对标的是Link:可以父变子变，也可以子变父变)。不要有初始值
  @Consume
  //名字要对得上
  message: string

  build() {
    Column() {
      Text('后代：' + this.message)
      Button('改变')
        .onClick(() => {
          this.message = '后代'
        })
    }
  }
}

export default ConsumeCase