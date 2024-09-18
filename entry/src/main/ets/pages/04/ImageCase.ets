@Entry
@Component
struct ImageCase {
  /**
   * 图片在页面中必须使用Image/ImageSpan/动画图片组件Image为图片组件，常用于在应用中显示图片。
   * Image支持加载string、PixelMap和Resource类型的数据源，支持png、jpg、bmp、svg和gif类型的图片格式。
   *
   * 本地图片展示的3个目录
   * ①在entry\src\main\ets下新建目录assets（放置特定资源，如emoji表情）
   * ②鸿蒙里也有专门的目录是可以放图片的，在entry/src/main/resources/base/media里面（推荐）
   * ③还可以在entry/src/main/resources/rawfile下放置 （可以解析成文件流的建议放这里）
   */
  build() {
    Column({ space: 10 }) {
      //1.assets
      //图片不给宽度，会默认占满屏幕，居中显示
      Image('/assets/b.png')//设置了宽度后，高度会按宽度进行缩放
        .width(100)

      //2.media 里面的图片需要使用$r，图片不要带后缀
      Image($r('app.media.b'))
        .width(100)

      //3.rawfile 下直接写文件名+后缀
      Image($rawfile('b.png'))
        .width(100)

      //4.使用系统内置资源
      Image($r('sys.media.ohos_ic_public_play'))
        .width(100)
        .aspectRatio(1)
          //修改图片颜色，关键字，16进制，RGB，枚举
        .fillColor(Color.Black)

      //5.iconFont下载图标
      Image($r('app.media.self_ic_back'))
        .width(100)
        //修改svg图片颜色
        .fillColor('red')

      //6.在线图片 预览器无限制,模拟器和真机需要开启网络权限
      //需要在entry/src/main/module.json5中的abilities上面一行添加     "requestPermissions": [  { "name": "ohos.permission.INTERNET" } ]
      Image('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
        .width(100)
    }
    .height('100%')
    .width('100%')

  }
}