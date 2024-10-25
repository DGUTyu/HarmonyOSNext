import { router } from '@kit.ArkUI';

@Entry
@Component
struct SharedIdCase01 {
  /**
   * 页面间元素共享转场动画实现：sharedTransition('共享标识')
   * 同一共享标识的组件在页面间切换时会形成动画
   */
  //组件共享动画  A页面元素动画到B页面的位置 + 路由跳转
  @State message: string = 'SharedIdCase01';

  build() {
    Column() {
      Image($r('app.media.b'))
        .width(300)
        .sharedTransition('selfImage')

      Text(this.message)

      Button('跳转')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/14/SharedIdCase02'
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}