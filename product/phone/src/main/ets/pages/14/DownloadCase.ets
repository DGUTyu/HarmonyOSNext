import { request } from '@kit.BasicServicesKit';

@Entry
@Component
struct DownloadCase {
  /**
   * 应用可以在“应用文件目录”下保存和处理自己的应用文件；系统文件及其目录对于应用是只读的；
   * 而应用若需访问用户文件，则需要通过特定API同时经过用户的相应授权才能进行。
   * “应用沙箱目录”内分为两类：应用文件目录和系统文件目录。
   * 系统文件目录对应用的可见范围由系统预置，开发者无需关注。
   *
   * 获取沙箱目录
   * getContext().cacheDir
   * getContext().fileDir
   * getContext().tempDir
   *
   * 文件操作
   * harmonyOS提供文件操作的API，相当于nodejs的中的fs操作
   * 值得注意的是：fileIO和fs模块都可以进行文件操作，fileIO支持自动导入，fs需要手动导入@ohos.file.fs
   * 在API9后官方推荐使用fs模块, fileIO和fs用法基本一致
   * open 打开文件
   * close 关闭文件
   * write写入文件
   * copy 复制文件
   * unlink 删除文件
   * mkdir 创建文件夹
   * rmdir 删除文件夹
   * 上述方法均支持promise并提供有对应的同步方法
   * 想要操作一个文件，首先要打开一个文件，读取一个文件的buffer或者fd，通过fd进行文件的buffer进行相应的操作
   */

  //试着下载一个图片到我们的沙箱路径，并且显示在页面上（模拟器）
  @State
  downloadUrl: string = 'https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png';
  @State
  filePath: string = ''

  build() {
    Row() {
      Column({ space: 20 }) {
        Image(this.downloadUrl)
          .width(200)
        Button('下载')
          .onClick(async () => {
            let filePath = getContext().cacheDir + '/test.jpg'
            const task = await request.downloadFile(getContext(), {
              url: this.downloadUrl,
              filePath: filePath
            })
            task.on('complete', () => {
              this.filePath = filePath
              AlertDialog.show({
                message: '下载成功'
              })
            })
          })

        if (this.filePath) {
          Image('file://' + this.filePath)
            .width(200)
        }
      }
      .width('100%')
    }
    .height('100%')

  }
}