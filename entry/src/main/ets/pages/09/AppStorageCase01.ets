import { router } from '@kit.ArkUI';

@Entry
@Component
struct AppStorageCase01 {
  /**
   * AppStorage是在应用启动的时候会被创建的单例。
   * 它的目的是为了提供应用状态数据的中心存储，这些状态数据在应用级别都是可访问的。
   * AppStorage将在应用运行过程保留其属性。属性通过唯一的键字符串值访问。
   * AppStorage可以和UI组件同步，且可以在应用业务逻辑中被访问。
   * AppStorage支持应用的主线程内多个UIAbility实例间的状态共享。
   * AppStorage中的属性可以被双向同步，数据可以是存在于本地或远程设备上，并具有不同的功能，
   * 比如数据持久化（详见PersistentStorage）。
   * 这些数据是通过业务逻辑中实现，与UI解耦，
   * 如果希望这些数据在UI中使用，需要用到@StorageProp和@StorageLink。
   *
   * AppStorage 是应用全局的UI状态存储，是和应用的进程绑定的，
   * 由UI框架在应用程序启动时创建，为应用程序UI状态属性提供中央存储。
   * -注意它也是内存数据，不会写入磁盘
   * 第一种用法-使用UI修饰符
   * ● 如果是初始化使用 AppStorage.setOrCreate(key,value)
   * ● 单向 @StorageProp('user') 组件内可变
   * ● 双向 @StorageLink('user') 全局均可变
   *
   * 第二种用法  使用API方法
   * ● AppStorage.get<ValueType>(key) 获取数据
   * ● AppStorage.set<ValueType>(key,value) 覆盖数据
   *
   * AppStorage.setOrCreate<T>("", T) // 创建或者设置某个字段的属性
   * AppStorage.get<T>("") // 获取的全局状态类型
   * 如果遇到获取数据的类型为空，可以用if判断，也可以用非空断言来解决
   * StorageLink . - 直接修改-自动同步到全局状态
   * StorageProp- 可以改，只会在当前组件生效，只是改的全局状态的副本，不会对全局状态产生影响
   */

  @State
  username: string = ""
  @State
  userAge: string = ""

  login(name: string, age: string) {
    const userInfo: Record<string, ResourceStr> = {
      'name': this.username,
      'age': this.userAge
    }

    //AppStorage.setOrCreate<Record<string, ResourceStr>>('userInfo', userInfo)
    AppStorage.setOrCreate('userInfo', userInfo)
    router.pushUrl({
      url: 'pages/09/AppStorageCase02'
    })
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        TextInput({ placeholder: '请输入用户名', text: $$this.username })
        TextInput({ placeholder: '请输入年龄', text: $$this.userAge })
          .type(InputType.Password)
        Button("登录")
          .width('100%')
          .onClick(() => {
            this.login(this.username, this.userAge)
          })
      }
      .padding(20)
      .width('100%')
    }
    .height('100%')
  }
}