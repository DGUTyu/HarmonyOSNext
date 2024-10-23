import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct CommentCase {
  @State
  pTitleText: string = '评论详情'

  build() {
    Column() {
      //  1.头部
      //  1.1 返回按钮 1.2标题
      // 不推荐Stack
      // Stack({ alignContent: Alignment.Start }) {
      //   Text('评论回复')
      //     .width('100%')
      //     .textAlign(TextAlign.Center)
      //   Image($r('sys.media.ohos_ic_compnent_titlebar_back'))
      //     .width(28)
      //     .aspectRatio(1)
      // }.width('100%')

      // Row() {
      //   Image($r('sys.media.ohos_ic_compnent_titlebar_back'))
      //     .width(30)
      //     .padding(6)
      //     .aspectRatio(1)
      //     .backgroundColor('#fff8f4f4')//圆形半径
      //     .borderRadius(15)
      //   Text('评论回复')
      //     .layoutWeight(1)
      //     .textAlign(TextAlign.Center)
      //   //推荐这种写法，为了后续编码更灵活
      //   Row() {
      //   }
      //   .width(24)
      //   .aspectRatio(1)
      // }.width('100%')
      // .padding(20)
      // .border({
      //   width: {
      //     bottom: 1
      //   },
      //   color: Color.Black
      // })

      // CommendHeader({
      //   //组件传递参数
      //   // 2.传递属性
      //   titleText2: '评论详情2'
      // })

      CommendHeader({
        //组件传递参数，传递过程只执行一次，后续父组件的更新不会同步给子组件
        // 2.传递属性
        titleText: this.pTitleText
      })
      Text(this.pTitleText)

      //  2.评论
      //  2.1头像 2.2用户名 2.3评论内容 2.4时间地点  2.5点赞
      Row({ space: 20 }) {
        Image('https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png!avatar30')
          .width(60)
          .borderRadius(30)
          .onClick(() => {
            //此时，CommendHeader组件的标题并不会更新
            this.pTitleText = '123'
            promptAction.showToast({
              message: this.pTitleText
            })
          })
        Column({ space: 20 }) {
          Text('鸿蒙').fontSize(24).fontWeight(FontWeight.Bold)
          //window系统，使用win + >(小于号) 即可唤起表情输入
          Text('鸿蒙太酷了🔥🔥🔥鸿蒙太酷了!鸿蒙太酷了!鸿蒙太酷了!鸿蒙太酷了!鸿蒙太酷了!鸿蒙太酷了!鸿蒙太酷了!')
            .fontSize(18)
            .maxLines(3)
            .textOverflow({
              //超出省略显示
              overflow: TextOverflow.Ellipsis
            })
          Row() {
            Text('09-18 IP:深圳').fontSize(12)
            Row({ space: 4 }) {
              Image($r('app.media.self_ic_like'))
                .width(20)
                .fillColor('#FFBF4E4E')
                .aspectRatio(1)
              Text('123').fontSize(12)
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
      .padding(20)

    }.height('100%')
    .width('100%')

  }
}

@Component
struct CommendHeader {
  //1.声明属性
  //titleText2: string = '评论回复'

  @State
  titleText: string = '评论回复'

  build() {
    Row() {
      Image($r('sys.media.ohos_ic_compnent_titlebar_back'))
        .width(30)
        .padding(6)
        .aspectRatio(1)
        .backgroundColor('#fff8f4f4')//圆形半径
        .borderRadius(15)
      Text(this.titleText)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
      //推荐这种写法，为了后续编码更灵活
      Row() {
      }
      .width(24)
      .aspectRatio(1)
    }.width('100%')
    .padding(20)
    .border({
      width: {
        bottom: 1
      },
      color: Color.Black
    })
  }
}