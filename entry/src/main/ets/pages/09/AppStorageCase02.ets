import { router } from '@kit.ArkUI'

@Entry
@Component
struct AppStorageCase02 {
  // 用法1:使用UI修饰符
  @StorageProp('userInfo')
  userInfo: Record<string, string> = {}
  // 用法2:使用API方法
  @State
  userInfo2: Record<string, string> = {}

  aboutToAppear(): void {
    const userInfo = AppStorage.get<Record<string, string>>('userInfo')
    //加上 !
    this.userInfo2 = userInfo!
  }

  build() {
    Column() {
      Row({ space: 20 }) {
        Image($r('app.media.b'))
          .width(60)
          .aspectRatio(1)
          .borderRadius(30)
        Column({ space: 10 }) {
          Text(`姓名1：${this.userInfo.name}`)
          Text(`年龄1：${this.userInfo.age}岁`)
        }

        Column({ space: 10 }) {
          Text(`姓名2：${this.userInfo2.name}`)
          Text(`年龄2：${this.userInfo2.age}岁`)
        }
      }
      .alignItems(VerticalAlign.Center)
      .padding(20)
      .width('100%')

      Button("修改这里的数据")
        .onClick(() => {
          this.userInfo.name = "码农"
          this.userInfo.age = "99"
        })

      Button("退出")
        .onClick(() => {
          router.back()
        })

      Button("userInfo置空")
        .onClick(() => {
          AppStorage.set('userInfo', null)
        })
    }
    .height('100%')
    .width('100%')
  }
}