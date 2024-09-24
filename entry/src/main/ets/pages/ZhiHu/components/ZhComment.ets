import { ReplyItem, ReplyItemModel } from '../ZhiHu'

@Preview
@Component
struct ZhComment {
  @State
  pTitleText: string = '评论详情'
  // 可以断言是因为我明确知道父组件会给我item替换我的初始值
  // 不知道初始数据可以用 ：as 是断言  理解为欺骗编辑器
  replyItem: ReplyItemModel = new ReplyItemModel({} as ReplyItem)

  build() {
    Column() {
      Row({ space: 12 }) {
        Image(this.replyItem.avatar)
          .width(40)
          .borderRadius(20)
        Column({ space: 12 }) {
          Text(this.replyItem.author).fontSize(24).fontWeight(FontWeight.Bold)
          //window系统，使用win + >(小于号) 即可唤起表情输入
          Text(this.replyItem.content)
            .maxLines(3)
            .textOverflow({
              //超出省略显示
              overflow: TextOverflow.Ellipsis
            })
          Row() {
            Text(`${this.replyItem.time} IP:${this.replyItem.area}`).fontSize(12)
            Row({ space: 4 }) {
              Image($r('app.media.self_ic_like'))
                .width(20)
                .fillColor('#FFBF4E4E')
                .aspectRatio(1)
              //由于使用as断言，这里不建议使用likeNum.toString(),会报错
              Text(this.replyItem.likeNum + '').fontSize(12)
            }
          }
          .width('100%')
          //主轴对齐，Row这里是两端对齐
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .layoutWeight(1)
        //侧轴左边对齐
        .alignItems(HorizontalAlign.Start)
      }
      //侧轴向上对齐
      .alignItems(VerticalAlign.Top)
      .width('100%')
      .padding({
        left: 16,
        right: 16,
        top: 8,
        bottom: 8
      })
    }
  }
}

export default ZhComment