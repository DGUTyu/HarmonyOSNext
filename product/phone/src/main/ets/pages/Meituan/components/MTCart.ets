import { FoodItem } from '../models'
import { CartStore } from '../utils/CartStore'
import MTCartItem from './MTCartItem'

@Component
struct MTCart {
  @Consume('showCart')
  showCart: boolean
  @StorageLink('Cart_List')
  cartList: FoodItem[] = []

  build() {
    Column() {
      // 购物车高度自适应(自定义弹层)
      Blank()
        .onClick(() => {
          this.showCart = false
        })
        .width('100%')
        .height('40%')
      Column() {
        Row() {
          Text('购物车')
            .fontSize(12)
          Text('清空购物车')
            .fontSize(12)
            .fontColor($r('app.color.search_font_color'))
            .onClick(() => {
              CartStore.clearCart()
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(15)

        Column() {
          //List最好要给个容器包裹，否则会进行重绘，影响性能
          List({ space: 12 }) {
            ForEach(this.cartList, (item: FoodItem) => {
              MTCartItem({
                item
              })
            }, (item: FoodItem, index: number) => {
              //复用id,避免图片刷新
              return item.id + ''
            })
            if (this.cartList.length === 0) {
              ListItem() {
                Text('暂无更多商品~')
                  .width('100%')
                  .padding(20)
                  .textAlign(TextAlign.Center)
              }
            }
          }
          .padding({
            left: 15,
            right: 15,
            bottom: 120
          })
          .width('100%')
          .height('100%')
        }
        .width('100%')
        .layoutWeight(1)

      }
      .borderRadius({
        topLeft: 6,
        topRight: 6
      })
      .layoutWeight(1)
      .backgroundColor($r('app.color.white'))
    }
    .width('100%')
    .height('100%')
    //半透明色
    .backgroundColor('rgba(0,0,0,0.5)')
  }
}

export default MTCart