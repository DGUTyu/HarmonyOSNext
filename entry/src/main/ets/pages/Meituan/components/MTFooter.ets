import { FoodItem } from '../models'

@Component
struct MTFooter {
  @Consume('showCart')
  showCart: boolean
  @StorageLink('Cart_List')
  cartList: FoodItem[] = []

  // 计算数量
  getTotalCount() {
    // reduce 累加求和函数，参数1：累加器 参数2：初始值
    //this.cartList.reduce(累加器，初始值)
    //累加器：（上一次的累计值，累加的每一项，求和数组，当前项的索引）=>{}
    //返回一个值！！！返回的这个值就是下一次的累加值
    const total = this.cartList.reduce((preValue, currenValue) => {
      return preValue + currenValue.count
    }, 0)
    return total
  }

  // 计算总价
  // 0.1加0.2不等于0.3 这是浮点数求和的精度问题
  getTotalPrice() {
    const total = this.cartList.reduce((preValue, currentValue) => {
      return preValue + currentValue.price * currentValue.count
    }, 0)
    return total
  }

  getAllCount() {
    return this.cartList.reduce((preValue, item) => preValue + item.count, 0).toString()
  }

  getAllPrice() {
    return this.cartList.reduce((preValue, item) => preValue + item.count * item.price, 0).toFixed(2)
  }

  build() {
    Row() {
      //Text('MTFooter')

      Row() {
        //外卖小哥
        //小红点，使用徽标
        Badge({
          value: this.getTotalCount().toString(),
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
            Span(this.getTotalPrice().toFixed(2))
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