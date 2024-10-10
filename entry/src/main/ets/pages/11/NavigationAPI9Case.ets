@Entry
@Component
struct NavigationAPI9Case {
  /**
   * Navigation组件是路由导航的根视图容器，一般作为Page页面的根容器使用，
   * 其内部默认包含了标题栏、内容区和工具栏，其中内容区默认首页显示导航内容（Navigation的子组件）
   * 或非首页显示（NavDestination的子组件），首页和非首页通过路由进行切换。
   *
   * 使用Navigation跳转的组件不需要再使用Entry来修饰，普通组件即可
   *
   * Navigation是一个导航组件，API9和API11的使用官方的推荐方式各不相同
   *
   * API9的用法- Navigation-NavRouter-(其他组件+NavDestination的用法)
   *
   * 使用Navigation在不同设备中会得到不同的视觉体验
   */
  build() {
    // 内置 = 自带路由效果(页面切换)
    Navigation() {
      Text('第一级页面')
      //   1.点击进行路由跳转的内容
      NavRouter() {
        //  只能放置一个组件，按钮1不会显示
        Button('按钮1')
        Button('按钮2')
        NavDestination() {
          //第二级页面顶部会有系统的页面返回键
          Text('第二级页面')
          Image($r('app.media.b'))
            .width('100%')
          NavRouter() {
            //  只能放置一个组件
            Button('按钮3')
            NavDestination() {
              Text('第3级页面')
            }
            .title('返回2')
          }
        }
        .title('返回1')
      }
    }.mode(NavigationMode.Auto)
  }
}