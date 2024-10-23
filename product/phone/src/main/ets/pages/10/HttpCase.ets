import { http } from '@kit.NetworkKit';
import { promptAction } from '@kit.ArkUI';

// import http from '@ohos.net.http';
// 上下两个包是一样

//引入Axios
import axios, { AxiosResponse } from '@ohos/axios'

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

  // OpenHarmony三方库中心仓：https://ohpm.openharmony.cn/#/cn/home
  // axios网络请求库：https://ohpm.openharmony.cn/#/cn/detail/@ohos%2Faxios
  // 可以在entry模块下安装，也可以在项目中安装。
  // 项目中安装步骤：项目右键，打开终端，输入命令：ohpm install @ohos/axios
  // 安装好后，项目会多出一个 oh_modules 的文件夹，里面包含了你下载的依赖
  // axios会对响应结果进行包装
  async sendAxios() {
    //get请求 需要声明返回结果的类型
    const res =
      await axios.get<object, AxiosResponse<object, null>>('https://zhousg.atomgit.net/harmonyos-next/takeaway.json')
    // res.data是个对象
    return res
  }

  build() {
    Column() {
      Column() {
        Button('发送Http请求')
          .onClick(() => {
            this.sendHttp()
          })

        Button('发送Axios请求')
          .onClick(async () => {
            // 1.发请求拿结果，需要使用 await与async
            const res = await this.sendAxios()
            // 2.提示结果
            promptAction.showDialog({
              message: JSON.stringify(res)
            })
          })
      }
      .height('100%')
      .width('100%')
    }
  }
}