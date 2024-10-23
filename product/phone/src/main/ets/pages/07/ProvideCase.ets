import ConsumeCase from './components/ConsumeCase';

@Entry
@Component
struct ProvideCase {
  // @Provide用于提供数据
  @Provide
  message: string = 'Hello World';

  build() {
    Column() {
      Text('祖先：' + this.message)
      Button('改变')
        .onClick(() => {
          this.message = '祖先'
        })
      ConsumeCase()
    }
    .height('100%')
    .width('100%')
  }
}