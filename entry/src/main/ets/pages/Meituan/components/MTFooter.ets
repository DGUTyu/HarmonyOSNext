@Component
struct MTFooter {
  @Consume
  showCart: boolean

  build() {
    Row() {
      //Text('MTFooter')

      Row() {
        //外卖小哥
        //小红点，使用徽标
        Badge({
          value: '0',
          position: BadgePosition.Right,
          style: {
            badgeSize: 18
          }
        }) {
          //尾随闭包
          Image($r('app.media.ic_public_cart'))
            .width(48)
            .height(70)
            .position({
              y: -20
            })
            .margin({
              left: 20
            })
            .onClick(() => {
              this.showCart = !this.showCart
            })
        }

        //结算价格
        Column() {
          Text() {
            Span('￥').fontSize(12)
            Span('123')
          }
          .fontColor($r('app.color.white'))

          Text('预计需要配续费￥5')
            .fontSize(14)
            .fontColor($r('app.color.white'))
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
        .margin({
          left: 10
        })

        //结算价格
        Text('去结算')
          .backgroundColor($r('app.color.main_color'))
          .height(50)
          .width(100)
          .textAlign(TextAlign.Center)
          .borderRadius({
            topRight: 25,
            bottomRight: 25,
          })
      }
      .width('100%')
      .backgroundColor($r('app.color.bottom_back'))
      .height(50)
      .borderRadius(25)
    }
    .width('100%')
    .padding({
      left: 20,
      right: 20,
      bottom: 20
    })
  }
}

export default MTFooter