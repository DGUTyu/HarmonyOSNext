import { http } from '@kit.NetworkKit';
import { promptAction } from '@kit.ArkUI';

// import http from '@ohos.net.http';
// 上下两个包是一样

@Entry
@Component
struct HttpCase {
  /**
   * request接口开发步骤
   * 1. 从@ohos.net.http.d.ts中导入http命名空间。
   * 2. 调用createHttp()方法，创建一个HttpRequest对象。
   * 3. 调用该对象的on()方法，订阅http响应头事件，此接口会比request请求先返回。可以根据业务需要订阅此消息。
   * 4. 调用该对象的request()方法，传入http请求的url地址和可选参数，发起网络请求。
   * 5. 按照实际业务需要，解析返回结果。
   * 6. 调用该对象的off()方法，取消订阅http响应头事件。
   * 7. 当该请求使用完毕时，调用destroy()方法主动销毁。
   */
  @State message: string = 'Hello World';

  async sendHttp() {
    //    1.引入http
    //    2.httpRequest对象的创建
    const req = http.createHttp()
    //    3.通过request对象发起请求
    const res = await req.request('https://zhousg.atomgit.net/harmonyos-next/takeaway.json')
    // res.result是字符串
    promptAction.showDialog({
      message: res.result as string
    })
  }

  build() {
    Column() {
      Column() {
        Button('发送Http请求')
          .onClick(() => {
            this.sendHttp()
          })
      }
      .height('100%')
      .width('100%')
    }
  }
}