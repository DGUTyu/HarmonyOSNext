import { router } from '@kit.ArkUI'
import { common, Want } from '@kit.AbilityKit'
import { localUserInfo } from './LocalStorageModel'

// 1.准备一个对象
export const localData: Record<string, string> = {
  // 'messageKey2': '雷军',
  'messageKey': '雷军',
  'name': '雷神'
}

// 2.初始化成localStorage数据
export const localStorage1 = new LocalStorage(localData)

// 3.传递要进行共享给页面

// 推荐：从EntryAbility内接收localStorage实现各个页面共享。getShared拿到页面启动的第二个参数
const localStorageEntry1 = LocalStorage.getShared()

// @Entry(localStorage1)
// @Entry(localStorageEntry1)
@Entry(localUserInfo)
@Component
struct LocalStorage01 {
  //LocalStorage页面级的存储状态 少用，只有卡片才用到
  @LocalStorageLink('messageKey')
  message: string = '老李'

  @LocalStorageLink('avtar')
  avtar: ResourceStr = ''
  @LocalStorageLink('nickName')
  nickName: ResourceStr = ''

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('修改名称')
        .onClick(() => {
          this.message = '老张'
        })
      LocalStorageChild01()

      Button('跳转02')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/09/LocalStorage02'
          })
        })

      Image(this.avtar).width(40).aspectRatio(1).margin(20)
      Text(this.nickName)
      Button('修改名称')
        .onClick(() => {
          this.nickName = 'hello'
        })
      Button('跳转UIAbility')
        .onClick(() => {
          // 1.准备一个跳转信息
          let want: Want = {
            'deviceId': '',
            'bundleName': 'cn.android.harmonyosnext',
            'abilityName': 'EntryAbility2'
          };
          //   坑：上面要带分号
          //   getContext()获取上下文
          (getContext() as common.UIAbilityContext).startAbility(want)
        })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct LocalStorageChild01 {
  @LocalStorageProp('messageKey')
  message: string = '小李'

  build() {
    // 父组件(祖先)内的一个message
    Text(this.message)
      .margin(10)
      .onClick(() => {
        this.message = '小赵'
      })

  }
}