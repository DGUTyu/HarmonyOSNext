@Entry
@Component
struct TabBarBuilderCase {
  @State
  list: TabInterface[] = [
    {
      icon: $r('app.media.ic_public_message'),
      selectIcon: $r('app.media.ic_public_message_filled'),
      name: 'wechat',
      title: '微信'
    },
    {
      icon: $r('app.media.ic_public_contacts_group'),
      selectIcon: $r('app.media.ic_public_contacts_group_filled'),
      name: 'connect',
      title: '联系人',
    },
    {
      icon: $r('app.media.ic_gallery_discover'),
      selectIcon: $r('app.media.ic_gallery_discover_filled'),
      name: 'discover',
      title: '发现',
    },
    {
      icon: $r('app.media.ic_public_contacts'),
      selectIcon: $r('app.media.ic_public_contacts_filled'),
      name: 'my',
      title: '我的',
    }
  ]

  @Builder
  CabBarItem(item: TabInterface) {
    // 需要自己根据激活的状态从而更新激活颜色
    Column({ space: 6 }) {
      Image(item.icon)
        .width(20)
        .aspectRatio(1)//拿属性判断比拿下标判断会更严谨一些
        .fillColor(item.name === this.list[this.currentIndex].name ? '#ff00ff0f' : '#ccc')
      Text(item.title)
        .fontSize(12)
        .fontColor(item.name === this.list[this.currentIndex].name ? '#ff00ff0f' : '#ccc')
    }
  }

  @State
  currentIndex: number = 0

  build() {
    Column() {
      //TabsBaseDemo()
      //方法1：使用引用传递
      //方法2：使用组件提供的方法
      Tabs({ barPosition: BarPosition.End, index: $$this.currentIndex }) {
        ForEach(this.list, (item: TabInterface) => {
          TabContent() {
            Text(item.name)
          }
          // 带不带小括号都行(有些特殊场合不可以带小括号)
          // 一但tabBar用了自定义构建函数，那么状态就要自己切换
          .tabBar(this.CabBarItem(item))
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}

interface TabInterface {
  name: string
  icon: ResourceStr
  selectIcon: ResourceStr
  title: string
}

@Builder
function TabsBaseDemo() {
  //支持滑动，并没有切换栏（需要加tabBar，默认加在顶部）
  //设置到底部
  Tabs({ barPosition: BarPosition.End }) {
    TabContent() {
      Text('wechat')
    }
    //字体的颜色会变化
    .tabBar('微信')

    TabContent() {
      Text('taobao')
    }
    .tabBar('淘宝')

    TabContent() {
      Text('connect')
    }
    //图标和字体的颜色都会变化
    .tabBar({
      icon: $r('sys.media.ohos_ic_public_voice_off'),
      text: '联系人'
    })
  }
}