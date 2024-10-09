import { FoodItem } from '../models'
import { CartStore } from '../utils/CartStore'

@Preview
@Component
struct MTAddCut {
  item: FoodItem = new FoodItem()
  @StorageLink('Cart_List')
  cartList: FoodItem[] = []

  // 计算当前商品的数量
  // 类似VUE的计算属性
  getCount() {
    // 通过当前商品的id去购物车列表中查询，查到的商品数量就是要展示的数量
    const index = this.cartList.findIndex(listItem => listItem.id === this.item.id)
    return this.cartList[index]?.count.toString() || '0'
  }

  build() {
    Row({ space: 8 }) {
      // 减:商品数量大于0时展示
      if(Number(this.getCount())>0){
        Row() {
          Image($r('app.media.ic_screenshot_line'))
            .width(10)
            .aspectRatio(1)
        }
        .width(16)
        .aspectRatio(1)
        .justifyContent(FlexAlign.Center)
        .backgroundColor($r("app.color.white"))
        .borderRadius(4)
        .border({ width: 0.5, color: $r("app.color.main_color") })
        .onClick(() => {
          CartStore.addCutCart(this.item, false)
        })
      }

      Text(this.getCount()).fontSize(14)
      // 加
      Row() {
        Image($r('app.media.ic_public_add_filled'))
          .width(10)
          .aspectRatio(1)

      }
      .width(16)
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r("app.color.main_color"))
      .borderRadius(4)
      .onClick(() => {
        CartStore.addCutCart(this.item)
      })
      .visibility(this.getCount() === this.item.maxCount?.toString() ? Visibility.Hidden : Visibility.Visible)
    }
  }
}

export default MTAddCut