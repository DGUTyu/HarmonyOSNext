@Entry
@Component
struct NavigationAPI11Case {
  // API11
  /**
   * 用法调整：使用NavPathStack+.navDestination()控制
   * 1.主页内容仍然写在Navigation中，跳转不再需要NavRouter组件，而是new NavPathStack()后跳转
   * 2.跳转的页面放置.navDestination()中，传入一个自定义构建函数，在函数中条件渲染
   * 总结：new NavPathStack()后的实例可以用于跳转，无论如何都会打开一个页面，
   * 渲染的内容仍然是.navDestination()中条件渲染的内容，如果没有满足的条件，就是一个空白页
   *
   * Navigation的这种跳转方式自带适配方案和转场动画，有特色但不容易定制，根据设计稿选择是否需要使用
   */

  @Builder
  navDesBuilder(name: string) {
    // 这个builder用于条件渲染展示的页面
    if (name === 'one') {
      // 必须用NavDestination才能显示
      NavDestination() {
        Text('one')
        Button('去TWO')
          .onClick(() => {
            this.navPathStack.pushPath({
              name: 'two'
            })
          })
      }.title('123')
      //.hideTitleBar(true)
      .hideTitleBar(false)

      // .mode(NavDestinationMode.DIALOG)
    } else if (name === 'two') {
      // 可以用组件
      NavigationChild()
    }
  }

  // 1.NavPathStack + navDestination(NavDestination)
  @Provide
  navPathStack: NavPathStack = new NavPathStack()

  build() {
    Navigation(this.navPathStack) {
      // FREE类型滚动时会自动收起title
      Scroll() {
        Column({ space: 20 }) {
          Button('下一页')
            .onClick(() => {
              this.navPathStack.pushPath({
                name: 'one'
              })
            })
          Image($r('app.media.b'))
          Image($r('app.media.b'))
          Image($r('app.media.b'))
        }
      }
    }
    .navDestination(this.navDesBuilder)
    .title('西北吴彦祖')
    .titleMode(NavigationTitleMode.Free)
  }
}

@Component
struct NavigationChild {
  @Consume
  navPathStack: NavPathStack

  build() {
    NavDestination() {
      Text('two')
      Button('去THREE')
        .onClick(() => {
          // 只要跳了，就会有个页面，只不过条件渲染没匹配上，不知道渲染什么
          this.navPathStack.pushPath({
            name: 'three'
          })
        })
    }
    //左上角返回键的图标
    .backButtonIcon($r('app.media.b'))
  }
}

@Component
struct NavigationChild2 {
  build() {
    NavDestination() {
      Text('three')
    }
  }
}