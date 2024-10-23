import { window } from '@kit.ArkUI'

@Entry
@Component
struct SafeAreaCase {
  /**
   * 模拟器顶部和底部空出来的这两部分叫做安全区，所谓沉浸式指的得就是关闭内置安全区，自己填充安全区的内容
   * 怎么实现呢？两种方案
   * 1. 使用windowStage的设置全屏的方式
   * 在ability中通过getMainWindow可以获取主窗体，然后通过得到的window对象设置全屏即可实现
   *
   * 2. 使用组件的安全区域扩展的方式
   * 通过window设置所有页面进行全局的设置，expandSafeArea是个按需的方式，哪个页面需要使用沉浸式，直接自己设置即可。
   */

  //页面中关闭沉浸式
  // aboutToAppear(): void {
  //   window.getLastWindow(getContext()).then(window => {
  //     window.setWindowLayoutFullScreen(false)
  //   })
  // }

  //页面中开启沉浸式
  // aboutToAppear(): void {
  //   window.getLastWindow(getContext()).then(window => {
  //     window.setWindowLayoutFullScreen(true)
  //   })
  // }

  @State
  topSafeHeight: number = 0
  @State
  bottomSafeHeight: number = 0

  async aboutToAppear() {
    const win = await window.getLastWindow(getContext())
    // 关闭沉浸式
    // win.setWindowLayoutFullScreen(false)
    // 防止全局没开启，指定页面开启沉浸式
    win.setWindowLayoutFullScreen(true)
    // 因为获取的安全区域的大小是px，所以需要用到vp的话 需要使用px2vp的方法来实现
    // 获取上方安全区高度 38.76923076923077
    this.topSafeHeight = px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height)
    // 获取下方安全区高度 28
    this.bottomSafeHeight =
      px2vp(win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect.height)
    AlertDialog.show({
      message: `
      上安全区:${this.topSafeHeight}
      下安全区:${this.bottomSafeHeight}`
    })
  }

  build() {
    Column() {
      Row() {
        //     自定义状态栏
      }
      .width('100%')
      .height(this.topSafeHeight)
      .backgroundColor(Color.Green)

      Image($r('app.media.b')).layoutWeight(1)
      //作用控制组件扩展其安全区域。
      // 状态沉浸(背景进行拓展，拓展到状态栏)
      //.expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
      Row() {
        //   自定义导航栏
      }
      .width('100%')
      .height(this.bottomSafeHeight)
      .backgroundColor(Color.Blue)
    }
    .height('100%')
    .width('100%')
    // .padding({
    //   top: this.topSafeHeight,
    //   bottom: this.bottomSafeHeight
    // })
    //开启沉浸式页面自定义安全区颜色
    // .backgroundColor(Color.Green)
    // .backgroundImageSize({ width: '100%', height: '100%' })
  }
}