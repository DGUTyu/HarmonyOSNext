import { router } from '@kit.ArkUI';

@Entry
@Component
struct RouterPushHsp {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Button('去HSP').onClick(() => {
        router.pushUrl({
          // 斜线/是当前模块，跨模块查找是通过包！
          // @bundle:包名/模块名/路径
          // 包名是在AppScope/app.json5的bundleName
          // 模块名是在features/SingSong/src/main/module.json5的name
          // 找的路径是从ets开始的，不要从src开始写，最后不要加文件后缀
          url:"@bundle:cn.android.harmonyosnext/SingSong/ets/pages/Index"
        })
      })
    }
    .height('100%')
    .width('100%')
  }
}