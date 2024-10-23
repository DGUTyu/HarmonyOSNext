import { common, Want } from '@kit.AbilityKit'

//只要加上这句就可以对AppStorage进行持久化
PersistentStorage.persistProp('token', 0)
//存储目录：/data/app/el2/100/base/cn.android.harmonyosnext/haps/entry/files/persistent_storage
//   存储内容
//   <?xml version="1.0" encoding="UTF-8"?>
//   <preferences version="1.0">
//   <string key="token">999999</string>
//   </preferences>

// AppStorage持久化只需要声明一下就可以了！！！
// PersistentStorage可以是对象，不能是数组对象，不能是对象嵌套
// PersistentStorage.persistProp('token',0)
// PersistentStorage设置了属性的页面，在这个页面进行声明属性的读写才是持久化的！！！因此不是很实用
// 只要声明过持久化的就不用再声明的。即A声明了，B中就不用再声明
// 持久化存储上限2KB
// 只能在UI页面使用
// 在EntryAbility中还用不了PersistentStorage

@Entry
@Component
struct AppStorageCase03 {
  @State
  loginToken: number = 0

  onPageShow(): void {
    // 通过API获取AppStorage的数据
    this.loginToken = AppStorage.get('token') as number
  }

  aboutToAppear(): void {

  }

  build() {
    Column({ space: 20 }) {
      Text(this.loginToken + '')
      TextInput({ placeholder: '请输入用户名' })
      TextInput({ placeholder: '请输入密码' })
      // 拉起一个新的ability
      Button('登录')
        .onClick(() => {
          // 1.api写法实现数据共享
          //   token -> 666666
          //   第一次在进行存储的时候(如果不确定就直接setOrCreate)
          AppStorage.setOrCreate('token', 666666)
          this.loginToken = 666666
          //   2.新的ability拉起
          // 参数：
          let want: Want = {
            'deviceId': '',
            'bundleName': 'cn.android.harmonyosnext',
            'abilityName': 'EntryAbility3'
          };
          // 坑点：大括号后面跟小括号数据语法错误，需要添加;
          // 动作：模拟器才能打开
          // 页面的上下文
          (getContext() as common.UIAbilityContext).startAbility(want)
        })
    }
    .height('100%')
    .width('100%')
    .padding(20)
  }
}