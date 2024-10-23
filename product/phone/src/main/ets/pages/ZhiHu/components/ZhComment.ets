import { ReplyItem, ReplyItemModel } from '../ZhiHu'

@Preview
@Component
struct ZhComment {
  // 可以断言是因为我明确知道父组件会给我item替换我的初始值
  // 不知道初始数据可以用 ：as 是断言  理解为欺骗编辑器
  // 投机取巧的办法：利用父组件传递引用数据类型的特性实现！！！
  @ObjectLink //解决点赞时，图片刷新问题
  //这里如果replyItem是基础数据类型，则行不通。@Link 才是真正实现这种方案的修饰符！！！
  replyItem: ReplyItemModel
  // 这种声明函数的方式专门用于接收父组件传递方法
  // changeLike: (id: number) => void = () => {
  //   // 子组件声明一个属性方法用于接收父组件可以修改点赞的真实方法
  // }

  build() {
    Column() {
      Row({ space: 12 }) {
        //不变的会复用。注意看顶部评论和评论列表的时间戳
        //Text(Date.now().toString())
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
                .fillColor(this.replyItem.likeFlag ? Color.Red : '#ffb5a8a8')
                .aspectRatio(1)
              //由于使用as断言，这里不建议使用likeNum.toString(),会报错
              Text(this.replyItem.likeNum + '')
                .fontSize(12)
                .fontColor(this.replyItem.likeFlag ? Color.Red : '#ffb5a8a8')
            }
            .onClick(()=>{
              //投机取巧->最简单实现点赞的办法。不推荐在子组件里去改父组件的数据，这个思想是错误的
              //点赞：如果没点赞，点赞标识->true ，点赞数量++ 如果点过赞,标识->false，数量--
              //数据变了，但是为什么UI没有更新？
              // if (this.replyItem.likeFlag) {
              //   this.replyItem.likeFlag = false
              //   this.replyItem.likeNum--
              // } else {
              //   this.replyItem.likeFlag = true
              //   this.replyItem.likeNum++
              // }
              //子组件传递给声明，父组件接收
              // this.changeLike(this.replyItem.id)

              //己经使用了ObjectLink修饰了传递的数据，就可以直接修改让UI更新
              if (this.replyItem.likeFlag) {
                this.replyItem.likeFlag = false
                this.replyItem.likeNum--
              } else {
                this.replyItem.likeFlag = true
                this.replyItem.likeNum++
              }
            })
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