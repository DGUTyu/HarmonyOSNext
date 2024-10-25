import { router } from '@kit.ArkUI';

@Entry
@Component
struct SharedIdCase02 {
  @State message: string = 'SharedIdCase02';

  build() {
    Column() {
      Text(this.message)
        // 可以是不同组件间进行转场，但是id必须是相同，切不要重复！！！
        .sharedTransition('selfImage')

      Image($r('app.media.b'))//前一个大小为300
        .width('100')
          //.sharedTransition('selfImage')
        .sharedTransition('selfImage', {
          duration: 1000
        })

      Button('push进入1')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/14/SharedIdCase01'
          })
        })
      Button('pop进入1')
        .onClick(() => {
          router.back()
        })
    }
    .height('100%')
    .width('100%')
  }
}