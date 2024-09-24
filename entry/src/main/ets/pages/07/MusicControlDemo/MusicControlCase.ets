import BackPlayComp from './components/BackPlayComp'
import PlayControlComp from './components/PlayControlComp'
import ShakenText from './components/ShakenText'

@Entry
@Component
struct MusicControlCase {
  @Provide
  isPlay: boolean = false

  @State
  list: TabInterface[] = [
    {
      icon: $r("app.media.ic_public_message"),
      selectIcon: $r('app.media.ic_public_message_filled'),
      name: 'wechat',
      title: '微信',
    }, {
    icon: $r('app.media.ic_public_contacts_group'),
    selectIcon: $r('app.media.ic_public_contacts_group_filled'),
    name: 'connect',
    title: '联系人',
  }, {
    icon: $r('app.media.ic_gallery_discover'),
    selectIcon: $r('app.media.ic_gallery_discover_filled'),
    name: 'discover',
    title: '发现',
  }, {
    icon: $r('app.media.ic_public_contacts'),
    selectIcon: $r('app.media.ic_public_contacts_filled'),
    name: 'my',
    title: '我的',
  }]

  // 标识：当前tabs组件激活的哪一项
  @State
  currentIndex: number = 0

  @Builder
  CabBarItem(item: TabInterface) {
    // 需要自己根据激活的状态从而更新激活颜色
    Column({ space: 6 }) {
      Image(item.name === this.list[this.currentIndex].name ? item.selectIcon : item.icon)
        .width(20)
        .aspectRatio(1)// this.list[this.currentIndex].name
        .fillColor(item.name === this.list[this.currentIndex].name ? '#ff00ff0f' : '#ccc')
      Text(item.title)
        .fontSize(12)
        .fontColor(item.name === this.list[this.currentIndex].name ? '#ff00ff0f' : '#ccc')
    }
  }

  build() {
    Row() {
      Stack({ alignContent: Alignment.Bottom }) {
        // Tabs里面只能放置TabContent
        Tabs({ index: $$this.currentIndex }) {
          ForEach(this.list, (item: TabInterface) => {
            TabContent() {
              if (item.name === 'wechat') {
                Column() {
                  ShakenText()
                  PlayControlComp()
                }
              } else {
                Column() {
                  Text(item.name)
                  PlayControlComp()
                }
              }
            }
            // 一般tabBar用了自定义构建函数，那么状态就要自己切换
            // 带不带小括号都行(有些特殊场合不可以带小括号)
            .tabBar(this.CabBarItem(item))

          })
        }.barPosition(BarPosition.End)

        BackPlayComp()
          .translate({
            y: -60
          })

      }.width('100%')
    }.height('100%')

  }
}

interface TabInterface {
  name: string
  icon: ResourceStr
  selectIcon: ResourceStr
  title: string
}