//首选项一样的工具类
import { FoodItem } from '../models';

//只要加上这句就可以对AppStorage进行持久化
PersistentStorage.persistProp('Cart_List', [])

export class CartStore {
  // 1.属性
  // static
  // 2.方法
  // 加减商品
  static addCutCart(item: FoodItem, flag: boolean = true) {
    // 1.拿到购物车列表(首选项，AppStorage+PersistentStorage)
    const list = AppStorage.get<FoodItem[]>('Cart_List')!
    const index = list.findIndex((listItem) => {
      return listItem.id === item.id
    })
    //   2.1+菜
    if (flag) {
      // 从购物车列表中查找，能找到就是第二次，找不到就是第一次
      if (index < 0) {
        // 3.1第一次添加(数量，购物车添加菜品)
        // 把菜品的信息重新拷贝一份，为了不影响原来的数据
        const newItem = new FoodItem()
        newItem.id = item.id
        newItem.name = item.name
        newItem.picture = item.picture
        newItem.price = item.price
        newItem.count = 1
        list.unshift(newItem)
      } else {
        // 3.2后续添加(数量)
        list[index].count++
        //如果改变的是第二层，存储的时候是不会发生更新
        list.splice(index, 1, list[index])
      }
    } else {
      //   2.2-菜
      list[index].count--
      if (list[index].count === 0) {
        //  3.3减到0(购物车删除菜品,数量减少)
        list.splice(index, 1)
      } else {
        //  3.4没减到0(数量减少)
        list.splice(index, 1, list[index])
      }
    }
    //   4.更新购物车的数据
    // 注意点：AppStorage如果更新了第二层及以后也不会发生变化！
    AppStorage.setOrCreate('Cart_List', list)
  }

  //   清空购物车
  static clearCart() {
    AppStorage.set('Cart_List', [])
  }
}