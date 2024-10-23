@Entry
@Component
struct TrackCase {
  /**
   * Track修饰符- 只针对对象中的某个属性的更新起作用，其余没修饰的属性不能进行UI展示
   */

  @State
  // goodInfo:GoodInfoTrack = {
  //   name:'西瓜',
  //   price:1.39,
  //   count:1
  // }
  goodInfo: GoodInfoTrackModel = new GoodInfoTrackModel({
    name: '西瓜',
    price: 1.39,
    count: 1,
    id: 0
  })

  trackFn(num: number) {
    // log打印 console.log(标识，数据)
    console.log('trackFnType', num)
    return '#fff'
  }

  build() {
    Column() {
      // 鸿蒙：改了一个对象的某个，这个对象所有用的属性相关的组件都会进行UI刷新！！！。如果需要局部改，需要加上@Track
      Text(this.goodInfo.name)
        .backgroundColor(this.trackFn(1))
      Text(this.goodInfo.price + '')
        .backgroundColor(this.trackFn(2))
      Text(this.goodInfo.count + '')
        .backgroundColor(this.trackFn(3))
      Button('数量++')
        .onClick(() => {
          this.goodInfo.count++
        })
    }
    .height('100%')
    .width('100%')
  }
}

interface GoodInfoTrack {
  name: string
  price: number
  count: number
  id: number
}

//Track修饰符就是在 对象级 数据更新时，只让自己改变的属性产生UI更新
class GoodInfoTrackModel {
  // 细节点：一旦一个对象上有Track修饰，那么没有UI关联的可以不加Track,其他UI关联的必须都得加Track
  // 意思是布局里显示了3个属性，则每个属性都要加上 Track
  @Track
  name: string = ''
  @Track
  price: number = 0
  @Track
  count: number = 0
  //UI没用到，可不加Track
  id: number = 0

  constructor(model: GoodInfoTrack) {
    this.name = model.name
    this.price = model.price
    this.count = model.count
    this.id = model.id
  }
}