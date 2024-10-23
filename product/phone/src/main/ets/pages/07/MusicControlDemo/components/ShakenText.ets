import { promptAction } from '@kit.ArkUI'

@Component
  //@Component 最好不要加@Preview
struct ShakenText {
  // 问题：我怎么知道isPlay发生变化了？？？
  // 场景：如果有一个数据发生变化了，需要做一件事，就用watch观察这个数据！！！
  // 1.oldValue不存在！！！
  // 2.在鸿蒙v1版本(稳定版)都不支持对象的多层观察！！！

  @Consume
  // @Watch('updateIsplay') : @Watch('函数名') -> 一旦观察的数据发生变化了，就会执行这个函数！！！
  @Watch('updateIsplay')
  isPlay: boolean
  @State
  shakenX: number = 0
  @State
  shakenY: number = 0
  //用于关闭定时器
  timer: number = -1

  //一进页面做的事！！
  // aboutToAppear(): void {
  //   //不要一上来就抖动
  //   setInterval(() => {
  //     //Math.random() 生成0到1,这里生成一个-2~2的随机数
  //     this.shakenX = 2 - Math.random() * 4
  //     this.shakenY = 2 - Math.random() * 4
  //   }, 30)
  // }

  //不是驼峰命名可以添加到词典，后续则不会有波浪线提醒
  updateIsplay() {
    // 一旦监听的数据发生变化就会触发这个函数！！！
    promptAction.showToast({
      message: 'Isplay变化了！！！'
    })
    if (this.isPlay) {
      this.timer = setInterval(() => {
        //Math.random() 生成0到1,这里生成一个-2~2的随机数
        this.shakenX = 2 - Math.random() * 4
        this.shakenY = 2 - Math.random() * 4
      }, 30)
    } else {
      clearInterval(this.timer)
    }
  }

  build() {
    Stack() {
      Text('抖音')
        .fontSize(60)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Black)
          // 通过zIndex控制堆叠层级
        .zIndex(2)
      Text('抖音')
        .fontSize(60)
        .fontWeight(FontWeight.Bold)
        .fontColor('#ff2f93ac')
        .translate({
          x: this.shakenX,
          y: this.shakenY,
        })
      Text('抖音')
        .fontSize(60)
        .fontWeight(FontWeight.Bold)
        .fontColor('#ffa118ba')
        .translate({
          // 不能和上一个的xy重复，否则就只展示一个字了！！！
          // x和y翻转过来
          x: this.shakenY,
          y: this.shakenX
        })
    }.width('100%')
    .height(300)
  }
}

export default ShakenText