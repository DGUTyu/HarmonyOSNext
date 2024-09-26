import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct ReviewObjectLinkCase {
  @State
  list: ReviewObjectLinkType[] = [
  //  2.数据必须是new装饰器类得到的
    new ReviewObjectLinkTypeModel({
      name: '西瓜',
      price: 1.39,
      count: 1
    })
  ]

  build() {
    Column() {
      Text(JSON.stringify(this.list))
      Text('count:' + this.list[0].count)
      Button('查看List')
        .onClick(() => {
          promptAction.showDialog({
            message: JSON.stringify(this.list)
          })
        })
      //子组件
      ReviewObjectLinkChild({
        goodInfo: this.list[0]
      })
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct ReviewObjectLinkChild {
  // 3.使用ObjectLink接收（会一直存在引用关系）
  // 区别：
  // 1.State得有初始值
  // 2.一旦State的数据地址改变了，就丢失引用关系了！！
  // @ObjectLink
  // goodInfo: ReviewObjectLinkTypeModel

  @State
  goodInfo: ReviewObjectLinkTypeModel = new ReviewObjectLinkTypeModel({} as ReviewObjectLinkType)


  build() {
    Row({ space: 20 }) {
      Text(this.goodInfo.name)
      Text('￥' + this.goodInfo.price)
      Button('-')
        .onClick(() => {
          this.goodInfo.count++
          // ObjectLink修饰的数据是不允许修改地址的！！！会闪退
          // 如果是@State修饰，则会断联系，父子的数据不同步
          this.goodInfo = new ReviewObjectLinkTypeModel(this.goodInfo as ReviewObjectLinkType)
        })
      Text('' + this.goodInfo.count)
      Button('+')
        .onClick(() => {
          this.goodInfo.count++
        })
    }
  }
}

interface ReviewObjectLinkType {
  name: string
  count: number
  price: number
}

// 1.给类加上修饰符
@Observed
class ReviewObjectLinkTypeModel {
  name: string = ''
  count: number = 0
  price: number = 0

  constructor(model: ReviewObjectLinkType) {
    this.name = model.name
    this.count = model.count
    this.price = model.price
  }
}