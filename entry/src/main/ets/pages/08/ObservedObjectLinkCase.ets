@Entry
@Component
struct ObservedObjectLinkCase {
  /**
   * 之前讲解Link的时候，我们说了一个要求，就是只有@State或者@Link修饰的数据才能用，
   * 如果是一个数组内有多个对象，将对象传递给子组件的时候就没有办法使用Link了
   * ArtTS支持 Observed和@ObjectLink来实现这个需求
   * 例如美团点菜，菜品肯定是一个数组，如果我们将每个菜品封装成组件
   * 当对菜品进行修改的时候，就没法再用Link同步了
   *
   * 使用步骤：
   * 使用 @Observed 修饰这个类
   * 初始化数据：数据确保是通过 @Observed 修饰的类new出来的
   * 通过 @ObjectLink 修饰传递的数据，可以直接修改被关联对象来更新UI 模拟一个点菜的案例来演示用法
   *
   * builder使用场景：无状态的结构组件(UI),组件内声明
   *
   *
   */

  @State
  goodsList: GoodItemLinkModel2[] = [
  // 2.传递给子组件的数据必须通过Observed修饰的类new出来
    new GoodItemLinkModel2({
      name: '瓜子',
      price: 5,
      count: 0
    }),
    new GoodItemLinkModel2({
      name: '花生',
      price: 4,
      count: 0
    }),
    new GoodItemLinkModel2({
      name: '矿泉水',
      price: 3,
      count: 0
    })
  ]
  @State
  count: number = 5
  //简单数据类型的子组件
  // build() {
  //   Column({ space: 20 }) {
  //     Text('父组件' + this.count)
  //     Button('修改父组件')
  //       .onClick(() => {
  //         this.count++
  //       })
  //     GoodItemLink({
  //       count: this.count
  //     })
  //   }
  //   .height('100%')
  //   .width('100%')
  //   .padding(20)
  // }

  //引用数据类型的子组件
  // @State
  // goodItem: GoodItemLinkModel = new GoodItemLinkModel({
  //   name: '西瓜',
  //   price: 1.5,
  //   count: 5
  // })
  //
  // build() {
  //   Column({ space: 20 }) {
  //     Text('父组件' + this.goodItem.count)
  //     Button('修改父组件')
  //       .onClick(() => {
  //         this.goodItem.count++
  //         //数据发生变化了，如果父组件的goodItem没有修饰符，则不会发生UI变化
  //         promptAction.showToast({
  //           message: '' + this.goodItem.count
  //         })
  //       })
  //     Text(JSON.stringify(this.goodItem))
  //     GoodItemLink2({
  //       goodItem: this.goodItem
  //     })
  //   }
  //   .height('100%')
  //   .width('100%')
  //   .padding(20)
  // }

  build() {
    Column({ space: 20 }) {
      Text(JSON.stringify(this.goodsList))
      ForEach(this.goodsList, (item: GoodItemLinkModel2) => {
        ObjectLinkChild({
          goodItem: item
        })
      })
    }
    .height('100%')
    .width('100%')
    .padding(20)
  }
}

// 简单数据类型的子组件：
// @State具备数据变化UI更新的能力
// 组件传值只会生效一次
// @Prop传递的数据是会深拷贝一份(父组件有一份，子组件也有一份，父组件变化会强制更新子组件，子组件自己变化不会影响父组件)
// @Link传递的数据是会共享一份(父组件和子组件公用一份，父组件变化会更新子组件，子组件变化也会更新父组件)
@Component
struct GoodItemLink {
  //builder使用场景：无状态的结构组件(UI),组件内声明
  @Link
  count: number

  build() {
    Column() {
      Text('子组件')
      Row({ space: 20 }) {
        Text('西瓜')
        Text('￥1.39')
        Image($r('sys.media.ohos_ic_public_remove_filled'))
          .width(24)
          .aspectRatio(1)
          .onClick(() => {
            this.count--
          })
        Text(this.count + '')
        Image($r('sys.media.ohos_ic_public_add_norm_filled'))
          .width(24)
          .aspectRatio(1)
          .onClick(() => {
            this.count++
          })
      }
    }
  }
}

//引用数据类型的子组件
// 问题现象：
// 1.父组件：引用数据类型  传递给了子组件 (父子都有@State进行修饰)   父改变属性->子UI更新
// 2.父组件：引用数据类型  传递给了子组件 (父子都有@State进行修饰)   子组件改变属性->父组件UI更新
// 原因：传递引用类型数据的时候父子会使用同一份数据，但是这个数据本身一旦发生变化，这个引用关系就没了！！！
@Component
struct GoodItemLink2 {
  @State //父组件加了@State，子组件也加@State，此时父组件的按钮会影响子组件的数量
  //如果这里用  @Prop ，则父组件即使更新了goodItem对象，也能通过@Prop传递给子组件
  goodItem: GoodItemLinkModel = new GoodItemLinkModel({} as GoodItemLinkType)

  // goodItem: GoodItemLinkModel = new GoodItemLinkModel({
  //   name: '苹果',
  //   price: 1.0,
  //   count: 2
  // })

  build() {
    Column() {
      Text('子组件')
      Row({ space: 20 }) {
        Text(this.goodItem.name)
        Text('￥' + this.goodItem.price)
        Image($r('sys.media.ohos_ic_public_remove_filled'))
          .width(24)
          .aspectRatio(1)
          .onClick(() => {
            this.goodItem.count--
          })
        Text(this.goodItem.count + '')
        Image($r('sys.media.ohos_ic_public_add_norm_filled'))
          .width(24)
          .aspectRatio(1)
          .onClick(() => {
            this.goodItem.count++
          })
      }

      Button('子组件改数据本身')
        .onClick(() => {
          //点击了，子组件会更新此UI，但父组件UI不会更新。并且父组件改了，子组件也不会更新了，因为断了联系，这个时候就体现出  @Prop的意义了。
          this.goodItem = new GoodItemLinkModel({
            name: '香蕉',
            price: 12,
            count: 10
          })
        })
    }
  }
}

// 数据结构
interface GoodItemLinkType {
  name: string
  price: number
  count: number
}

//类->可以生成对象
export class GoodItemLinkModel {
  name: string = ''
  price: number = 0
  count: number = 0

  constructor(model: GoodItemLinkType) {
    this.name = model.name
    this.price = model.price
    this.count = model.count
  }
}

//类->可以生成对象
// 1.给生成数据的类添加Observed修饰符
@Observed
export class GoodItemLinkModel2 implements GoodItemLinkType {
  name: string = ''
  price: number = 0
  count: number = 0

  constructor(model: GoodItemLinkType) {
    this.name = model.name
    this.price = model.price
    this.count = model.count
  }
}

@Component
struct ObjectLinkChild {
  // 不能用Link的原因：必须是@State修饰才能进行传递！！！
  // 如果一个引用数据，希望传递后在子组件改自身或者第一层的时候可以产生UI的更新Observed + ObjectLik
  // 3.对传递的数据使用ObjectLink进行修饰
  // 如果修改了属性，只进行局部刷新(不会进行组件的销毁和创建)
  // @ObjectLink
  // goodItem: GoodItemLinkModel2 //{ 1.name:{ 2.age:} }

  @ObjectLink
  goodItem: GoodItemLinkModel2

  build() {
    Row({ space: 20 }) {
      Text(this.goodItem.name)
      Text('￥' + this.goodItem.price)
      Image($r('sys.media.ohos_ic_public_remove_filled'))
        .width(24)
        .aspectRatio(1)
        .onClick(() => {
          this.goodItem.count--
        })
      Text(this.goodItem.count + '')
      Image($r('sys.media.ohos_ic_public_add_norm_filled'))
        .width(24)
        .aspectRatio(1)
        .onClick(() => {
          this.goodItem.count++
          // ObjectLink的对象不允许赋值！！！错误示例：
          // this.goodItem = new GoodItemLinkModel(this.goodItem as GoodItemLinkType)
        })
    }
  }
}