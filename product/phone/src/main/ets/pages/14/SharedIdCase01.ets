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

  //页面转场动画，与build同级别 两类：入场和离场 一共4种：左边2种，右边2种
  pageTransition() {
    // 定义页面进入时的效果，从右侧滑入，时长为1000ms，页面栈发生push操作时该效果才生效
    PageTransitionEnter({ type: RouteType.Push, duration: 3000 })
      .slide(SlideEffect.Right)
    // 定义页面进入时的效果，从左侧滑入，时长为1000ms，页面栈发生pop操作时该效果才生效
    PageTransitionEnter({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Left)
    // 定义页面退出时的效果，向左侧滑出，时长为1000ms，页面栈发生push操作时该效果才生效
    PageTransitionExit({ type: RouteType.Push, duration: 3000 })
      .slide(SlideEffect.Left)
    // 定义页面退出时的效果，向右侧滑出，时长为1000ms，页面栈发生pop操作时该效果才生效
    PageTransitionExit({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Right)
  }
}