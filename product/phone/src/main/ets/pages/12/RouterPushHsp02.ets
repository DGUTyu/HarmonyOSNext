import { router } from '@kit.ArkUI';

import("@ohos/mySingSong/src/main/ets/pages/HSPIndex")

@Entry
@Component
struct RouterPushHsp02 {
  @State message: string = 'Hello World';

  /**
   * 在想要跳转到的共享包页面里，给@Entry修饰的自定义组件命名并 导出 ，'hsp_test'是自定义的名字
   * 同时需要在当前包引入对于share包的依赖oh-package.json5，demo是自定义的名字
   * 配置成功后需要在跳转的页面中引入命名路由的页面
   * 这种操作只适合从hap包 -> hsp一次性的跳转，假设有很多个页面都需要这么跳转，还是采用router
   */

  navPathStack: NavPathStack = new NavPathStack()

  build() {
    Column() {
      Text('使用路径name跳转hsp')
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          router.pushNamedRoute({
            name: 'hsp_test',
            params: {
              id: 123456789
            }
          })
        })

      Navigation(this.navPathStack) {
        Button('使用路由配置跳转hsp').onClick(() => {
          this.navPathStack.pushPath({
            name: 'HSPPage'
          })
        })
      }

    }.width('100%')
    .height('100%')

  }
}