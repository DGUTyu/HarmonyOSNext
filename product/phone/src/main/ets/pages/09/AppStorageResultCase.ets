@Entry
@Component
struct AppStorageResultCase {
  // 2.使用UI修饰符进行AppStorage的使用
  // 总结：
  // 需要将数据在页面进行展示，UI修饰符@StorageLink('token')
  // 如果需要数据的修改，API：AppStorage.setOrCreate('key',value)
  // value可以是引用数据类型，初始化数据必须使用API

  // 学习思路：
  // 1.学语法
  // 2.应用案例
  // 3.综合案例
  @StorageLink('token')
  token: number = 0

  build() {
    RelativeContainer() {
      Text(this.token + '')
        .backgroundColor(Color.Pink)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .id('tokenText')

      Button('修改token')
        .onClick(() => {
          //  UI修饰符的修改
          //this.token = 333333
          //   API修改
          AppStorage.set('token', 999999)
        })
        .alignRules({
          top: { anchor: 'tokenText', align: VerticalAlign.Bottom },
          middle: { anchor: 'tokenText', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}