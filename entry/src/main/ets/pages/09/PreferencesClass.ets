//封装一个工具类，用于首选项存储:静态类
import { preferences } from '@kit.ArkData'
import { Context } from '@kit.AbilityKit'

export class PreferencesClass {
  // 静态属性
  static key: string = '123'

  // 静态方法
  static getKey() {
    return PreferencesClass.key
  }

  // 仓库(文件:存储大小8KB) -> key:val
  static defaultStore: string = 'DEFAULT_STORE'
  // 字段(文件存储的属性)
  static tokenKey: string = 'TOKEN_KEY'

  //   1.获取仓库(有了就获取，没有就新建)
  static getStore(context: Context, storeName: string) {
    const store = preferences.getPreferencesSync(context, {
      //仓库名称传了，则用storeName；否则，用默认的名称
      name: storeName || PreferencesClass.defaultStore
    })
    return store
  }

  //   2.仓库中的字段设置值
  static async setToken(context: Context, storeName: string, value: string) {
    const store = PreferencesClass.getStore(context, storeName)
    //同步执行
    //store.putSync(PreferencesClass.tokenKey, value)
    await store.put(PreferencesClass.tokenKey, value)
    // 将字段store字段写入磁盘
    // await就是等待的,必须搭配async使用，async是要写在await所在函数前面
    await store.flush()
  }

  //   3.仓库中的字段读取值
  static getToken(context: Context, storeName: string, tokenKey: string) {
    //   1.知道是哪个仓库
    const store = PreferencesClass.getStore(context, storeName)
    //   2.取哪个字段
    const token = store.getSync(tokenKey, '')
    return token
  }
}