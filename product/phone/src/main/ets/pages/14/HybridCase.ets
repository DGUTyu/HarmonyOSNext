import { webview } from '@kit.ArkWeb'
import { promptAction } from '@kit.ArkUI'
import { photoAccessHelper } from '@kit.MediaLibraryKit'

@Entry
@Component
struct HybridCase {
  /**
   * 混合开发：原生鸿蒙+H5网页混合进行开发
   * 打通原生和h5的桥梁:
   * 原生鸿蒙应用如何控制网页
   * 前提：网页必须准备了可以进行控制的方法！
   *
   * 网页如何控制原生鸿蒙应用
   * 原生方法：可以做什何事！
   */
  controller: WebviewController = new webview.WebviewController()

  sayHi() {
    promptAction.showDialog({
      title: '警告',
      message: '我是原生的提示'
    })
  }

  async openAlbum(num: number) {
    const photo = new photoAccessHelper.PhotoViewPicker()
    await photo.select({
      maxSelectNumber: num
    })
  }

  build() {

    Column({ space: 5 }) {
      Button('鸿蒙的按钮-控制网页')
        .onClick(() => {
          //changeTitle要加括号
          this.controller.runJavaScript("changeTitle()")
        })

      Button('鸿蒙的按钮-原生提示')
        .onClick(() => {
          this.sayHi()
        })

      Button('给网页注入方法')
        .onClick(() => {
          //registerJavaScriptProxy(注入的内容-对象，注入的对象名称,暴露的方法)
          this.controller.registerJavaScriptProxy({
            objKey: () => {
              this.sayHi()
            }
          }, 'objName', ['objKey'])
        })

      Button('给网页注入方法打开相册')
        .onClick(() => {
          this.controller.registerJavaScriptProxy({
            objKey2: (num: number) => {
              this.openAlbum(num)
            }
          }, 'objName2', ['objKey2'])
        })

      //给网页注入方法后要刷新
      Button('刷新网页')
        .onClick(() => {
          this.controller.refresh()
        })

      Web({
        //1.在线网页
        //src: 'https://www.bilibili.com',
        controller: this.controller,
        //2.离线网页
        src: $rawfile('test.html')
      })
    }

  }
}