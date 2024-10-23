import { localUserInfo } from './LocalStorageModel'

@Entry(localUserInfo)
@Component
struct LocalStorage03 {
  /**
   * LocalStorage 是页面级的UI状态存储，通过 @Entry 装饰器接收的参数可以在页面内共享同一个 LocalStorage 实例。
   * LocalStorage 也可以在 UIAbility 内，页面间共享状态。
   * 用法
   * ● 创建 LocalStorage 实例：const storage = new LocalStorage({ key: value })
   * ● 单向 @LocalStorageProp('user') 组件内可变
   * ● 双向 @LocalStorageLink('user') 全局均可变
   */

  @LocalStorageProp('nickName')
  //@LocalStorageLink('nickName')
  nickName: ResourceStr = ''

  build() {
    Column() {
      Text('page LocalStorage03')
      Text(this.nickName)
      Button('修改名称')
        .onClick(() => {
          this.nickName = 'hello world'
        })
    }
    .height('100%')
    .width('100%')
  }
}