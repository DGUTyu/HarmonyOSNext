import ContactsPage from './view/ContactsPage'
import GoodInfoPage from './view/GoodInfoPage'
import HomePage from './view/HomePage'
import PayPage from './view/PayPage'

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
          Image($r('app.media.b'))
          Image($r('app.media.b'))
          Image($r('app.media.b'))
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
  }
}