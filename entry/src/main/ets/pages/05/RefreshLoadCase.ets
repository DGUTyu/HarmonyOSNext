import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct RefreshLoadCase {
  // 准备数据，填充时间戳
  @State
  list: number[] = Array(20).fill(Date.now())
  @State
  //1.是否刷新中的标志
  refreshFlag: boolean = false

  //2.刷新时的页面
  @Builder
  refreshBuilder() {
    //页面的结构
    Text('当前正在加载中...')
      .width('100%')
      .textAlign(TextAlign.Center)
      .backgroundColor(Color.Pink)
  }

  //滚动控制器，传递给List
  scroller: Scroller = new Scroller()
  @State
  //当前是不是结束了
  isEnd: boolean = false

  build() {
    Column() {
      Refresh({
        refreshing: $$this.refreshFlag,
        //带不带括号都可以
        builder: this.refreshBuilder
      }) {
        List({ scroller: this.scroller }) {
          ForEach(this.list, (item: number) => {
            ListItem() {
              Text(item.toString())
                .width('100%')
                .padding(20)
                .border({
                  width: {
                    bottom: 1
                  },
                  color: '#efefef'
                })
            }
          })
        }
        //开始滚动
        .onScrollStart(() => {
          this.isEnd = false
        })
        //结束滚动
        .onScrollStop(() => {
          //滚动动作停止，需要判断到没到底部
          if (this.isEnd) {
            //新增数据
            //...延展运算符，相当于把数组的[]去掉，只要内容
            this.list.push(...Array(10).fill(Date.now()))
            //加完数据后，还要滚动到底部
            this.scroller.scrollEdge(Edge.Bottom)
            promptAction.showToast({
              message: '新增10条数据'
            })
          }
        })
        .onReachEnd(() => {
          //触及底部事件，会触发2次
          //特性就是会触发两次  第一次触底 第二次回弹。两次吐司
          this.isEnd = true
          // promptAction.showToast({
          //   message: '新增5条数据'
          // })
        })
      }
      .onRefreshing(() => {
        //刷新中
        setTimeout(() => {
          this.list = Array(20).fill(Date.now())
          this.refreshFlag = false
        }, 2000)
      })

    }
  }
}