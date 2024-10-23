import { getData } from '../api'
import { Category, FoodItem } from '../models'
import MTFoodItem from './MTFoodItem'

@Component
struct MTMain {
  @State
  menuList: Category[] = []
  @State
  activeIndex: number = 0

  // async aboutToAppear(): Promise<void> {
  //   await getData()
  // }

  //能不写类型就不写类型
  async aboutToAppear() {
    this.menuList = await getData()
  }

  build() {
    Row() {
      //左侧的容器
      Scroll() {
        Column() {
          ForEach(this.menuList, (item: Category, index: number) => {
            Text(item.name)
              .height(50)
              .width('100%')
              .textAlign(TextAlign.Center)
              .fontSize(14)
              .backgroundColor(this.activeIndex === index ? $r("app.color.white") : $r("app.color.left_back_color"))
              .onClick(() => {
                this.activeIndex = index
              })

          })
        }
        .width(90)
        .height('100%')
        .backgroundColor($r('app.color.left_back_color'))
      }

      //右侧的菜品详情
      //List组什最好给宽高！
      //如果没有固定的宽高，内容的加载会导致List组件大小变化〔重排重绘影响性能)
      Column() {
        List() {
          //加上 ?.
          ForEach(this.menuList[this.activeIndex]?.foods || [], (item: FoodItem) => {
            ListItem() {
              MTFoodItem({ item })
            }
          })
        }
        .width('100%')
        .height('100%')
      }
      .layoutWeight(1)
      .height('100%')
    }
  }
}

export default MTMain