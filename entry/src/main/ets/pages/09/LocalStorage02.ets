import { localStorage1, localData } from './LocalStorage01'
// 如果引入其他页面的localStorage是可以直接共享的
// localStorage1引入的方案不推荐！！！

// 如果是重新创建一个localStorage就不是共享的了,搭配@Entry(localStorage2)
const localStorage2 = new LocalStorage(localData)

const localStorageEntry2 = LocalStorage.getShared()

// @Entry(localStorage1)
@Entry(localStorageEntry2)
@Component
struct LocalStorage02 {
  @LocalStorageLink('messageKey')
  message: string = '02'

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('修改')
        .onClick(() => {
          this.message = '潘神！！'
        })
    }
    .height('100%')
    .width('100%')
  }
}