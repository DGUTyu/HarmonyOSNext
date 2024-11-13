import { request, zlib } from '@kit.BasicServicesKit'
import { promptAction, router } from '@kit.ArkUI'
import { fileIo } from '@kit.CoreFileKit'

@Entry
@Component
struct HybridHotLoadCase {
  /**
   * /data/app/el2/100/base/cn.android.harmonyosnext/haps/phone/cache/toutiao.zip
   */

  @State
  downloadUrl: string = 'https://gitee.com/shuiruohanyu/toutiao_net/raw/master/resources/toutiao.zip'
  // 控制进度条的
  @State
  current: number = 0
  @State
  total: number = 0

  //解压缩的方法
  decompressFile(path: string) {
    //压缩
    //zlib.compressFile()
    //解压
    zlib.decompressFile(path, getContext().cacheDir, () => {
      //解压完成后
      router.pushUrl({
        url: 'pages/14/PreviewHotLoadCase'
      })
    })
  }

  build() {
    Column() {
      Progress({
        value: this.current,
        total: this.total
      })
      Button("下载")
        .onClick(async () => {
          //准备沙箱的地址,要加上文件名
          let path = getContext().cacheDir + '/toutiao.zip'
          //版本校验
          // toutiaov1.12.3.zip，1是大版本，2是功能版本，3是bug版本
          //本地 toutiao时间戳1.zip
          //服务器 toutiao时间戳2.zip
          //文件名裁剪toutiao，比较时间戳大小

          if (fileIo.listFileSync(getContext().cacheDir).includes('toutiao.zip')) {
            //包含，已近有了，先备份，再重写
            fileIo.renameSync(path, getContext().cacheDir + '/toutiao.base.zip')
          }

          //下载文件
          const task = await request.downloadFile(getContext(), {
            //下载的地址
            url: this.downloadUrl,
            //下载完存放的地址（沙箱中）
            filePath: path
          })

          //监所下载任务从而知道是否下载完毕
          task.on('progress', (current, total) => {
            // if(current>total/2){
            //   task.suspend(()=>{
            //     promptAction.showToast({
            //       message:'暂停下载'
            //     })
            //   })
            // }
            this.current = current
            this.total = total
          })

          task.on('pause', () => {

          })

          // task.on('fail', () => {
          //   promptAction.showToast({
          //     message: '下载失败'
          //   })
          // })

          task.on("fail", (error) => {
            AlertDialog.show({ message: error.toString() })
          })

          task.on('complete', () => {
            this.decompressFile(path)
            AlertDialog.show({
              message: '下载成功'
            })
          })
        })
      //1.下载到沙箱
      //2.怎么找到沙箱？上下文
      //3下载？download
      //4.压缩包？？？里面的文件态么提取？？？解压
      //5.将网页进行预觉？混合开发
    }
    .height('100%')
    .width('100%')
  }
}