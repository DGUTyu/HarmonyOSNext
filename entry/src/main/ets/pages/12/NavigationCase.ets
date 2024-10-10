import ContactsPage from './view/ContactsPage'
import GoodInfoPage from './view/GoodInfoPage'
import HomePage from './view/HomePage'
import PayPage from './view/PayPage'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct NavigationCase {
  // 自定义tabs切换的标识
  @State
  active: string = 'home'

  @Builder
  NavToolbar() {
    Row() {
      Column() {
        Image($r('app.media.ic_public_message'))
          .width(24)
        Text('首页')
          .fontColor(this.active === 'home' ? '#ff00ff0f' : '#000')
      }
      .onClick(() => {
        this.active = 'home'
      })

      Column() {
        Image($r('app.media.ic_public_contacts'))
          .width(24)
        Text('联系人')
          .fontColor(this.active === 'contacts' ? '#ff00ff0f' : '#000')
      }
      .onClick(() => {
        this.active = 'contacts'
      })
    }.width('100%')
    .justifyContent(FlexAlign.SpaceAround)
  }

  // 2.页面跳转条件：
  // 2.1 跳转的路由栈（控制器）
  @Provide
  navStack: NavPathStack = new NavPathStack()

  // 2.3准备一个路由出口容器
  @Builder
  NavRouterPage(name: string) {
    // 展示的内容是根据跳转的进行条件渲染
    // 如果匹配到了就渲染对应的内容，如果匹配不到就空白！
    if (name === 'goodInfo') {
      GoodInfoPage()
    } else if (name === 'pay') {
      //   支付页面
      PayPage()
    }
    // 到底展示哪个页面通过跳转的name进行条件判断即可
    // else if(name==='xxx'){
    //
    // }
  }

  // 右上角菜单
  @Builder
  NavMenus() {
    Image($r('sys.media.ohos_ic_public_scan'))
      .width(24)
      .aspectRatio(1)
      .onClick(() => {
        AppStorage.setOrCreate('token', '2024')
      })
  }

  //Navigation路由拦截
  registerInterceptors() {
    this.navStack.setInterception({
      //跳转之前的拦截 f:来的信息 t:去的信息
      willShow: (f, t) => {
        if (typeof t === 'string') {
          return
        }
        //跳转一个不存在的页面，t.pathInfo则为空
        if (!t.pathInfo) {
          //404页面 这里只能用f来跳转
          promptAction.showToast({
            message: '拦截到要去404'
          })
          return
        }

        if (t.pathInfo.name === 'goodInfo') {
          // promptAction.showToast({
          //   message:'拦截到要去goodInfo'
          // })

          //拦截
          const token = AppStorage.get('token')! as string
          if (token !== '2024') {
            t.pathStack.pop()
            promptAction.showToast({
              message: '商品也拦截去联系人页面'
            })
            t.pathStack.pushPath({
              name: 'MyContacts'
            })
          }
          return
        }
      },

      //跳转之后的拦截 场景：鉴权
      didShow: () => {

      }
    })
  }

  // 和路由完全不是一个东西
  build() {
    Navigation(this.navStack) {
      //  1.首页看到的内容：
      //  条件渲染

      Scroll() {
        Column() {
          if (this.active === 'home') {
            HomePage()
          } else if (this.active === 'contacts') {
            ContactsPage()
          }
        }
      }
    }
    // 2.实现tabs切换的功能
    .toolbarConfiguration(this.NavToolbar)
    .navDestination(this.NavRouterPage)
    .height('100%')
    .width('100%')
    .title('首页')
    .titleMode(NavigationTitleMode.Mini)
    .menus(this.NavMenus)
    //折叠屏不分列
    //.mode(NavigationMode.Stack)
    //折叠屏自动分列
    .mode(NavigationMode.Auto)
    //拦截器
    .onAppear(() => {
      this.registerInterceptors()
    })
  }
}

//总结：
//1.路由栈是自己维护的：
// Navigation里面展示的内容不是路由栈的内容，叫导航栏
//在单列模式下，他是一个页面，在双列模式下，他是左侧边栏，右侧是路由界面
//2.路由配置表
//2.1 main-page.json5 ,routerMap
//2.2 profile routerMap.json
//3.路由出口展示
//必须被NavDestination包裹，展示内容可以被路由拦截器拦截