// 枚举值用法
enum MyFlexAlign {
  Start = 'start',
  Center = 'center',
  End = 'end'
}

enum MyFlexAlign1{
  //会给一个默认值，从0开始，0，1，2
  Start,
  Center,
  End
}


@Entry
@Component
struct CommonStyleCase {
  build() {
    Column() {
      Row() {

      }
      .width('100%')
      .height(50)
      .backgroundColor(Color.Orange)
      //放0，1，2都可以，一般放枚举值
      .justifyContent(2)

    }.height('100%')
    .width('100%')
  }
}