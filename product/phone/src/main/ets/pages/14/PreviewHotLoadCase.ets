import { webview } from '@kit.ArkWeb';

@Entry
@Component
struct PreviewHotLoadCase {
  @State message: string = 'Hello World';
  controller: WebviewController = new webview.WebviewController()

  aboutToAppear() {
    // 配置Web开启调试模式
    // .WebviewController.setWebDebuggingAccess(true);
    webview.WebviewController.setWebDebuggingAccess(true);
  }

  build() {
    Column() {
      Web({
        //沙箱内的所有文件，使用过程中部需要携带file://协议
        src: 'file://' + getContext().cacheDir + '/toutiao/index.html',
        controller: this.controller
      })//fileAccess支持web组件使用沙箱的文件，必须要开启协议
        //domStorageAccess支持web组件进行本地缓存
        .fileAccess(true)
        .domStorageAccess(true)
    }
    .height('100%')
    .width('100%')
  }
}