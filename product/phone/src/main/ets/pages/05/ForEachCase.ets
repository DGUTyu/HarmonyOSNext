@Entry
@Component
struct ForEachCase {
  /** ForEach-最常用的 */

  // 1.循环渲染-前提是有数据
  @State
  list: PayItemType[] = [
    {
      name: "给老婆买口红",
      price: 299.01,
      //payDate: new Date('20240918') //Invalid Date
      payDate: new Date('2024.09.18') //Invalid Date
    },
    {
      name: "给老婆买花",
      price: 199.10,
      payDate: new Date('2024/09/19')
    },
    {
      name: "给自己买好吃的",
      price: 899.001,
      payDate: new Date('2024-09-20')
    },
  ]

  build() {
    Column() {
      //ListDemo()
      //ListDemo2()

      List({ space: 20 }) {
        //ForEach(数据(数组)，结构体生成函数，键生成函数(可以不写) )
        //ForEach([],()=>{})
        ForEach(this.list, (item: PayItemType) => {
          ListItem() {
            Column() {
              Row() {
                Text(item.name)
              }
              .width('100%')

              Row({ space: 20 }) {
                //toFixed是number类型的方法 保留几位小数
                Text('￥' + item.price.toFixed(3)).fontColor(Color.Red)
                Text(item.payDate.toLocaleDateString())
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .justifyContent(FlexAlign.Start)
          }
        }, (payItem: PayItemType, index: number) => {
          //括号里的参数可选可不写

          // 宁愿不写，但是得知道源码的逻辑
          // 键的作用：是让UI组件有一个唯一的标识
          // 源码处理：index_ + JSON.stringify(payItem)
          // 错误演示：返回固定字符串，则只会显示一个数据
          // return '999'
          // 错误演示：返回索引，dom比对异常
          // return index.toString()
          // 目的：返回一个唯一的标识！
          return index + '_' + JSON.stringify(payItem)
        })

        ListItem() {
          Column({ space: 20 }) {
            Row() {
              Text('我是有底线的~')
            }.width('100%')
            .justifyContent(FlexAlign.Center)
          }.padding(20)
        }
      }

      // 不影响添加
      // .layoutWeight(1)
      // .width('100%')

      //会在顶部添加
      Button('头部新增电脑')
        .onClick(() => {
          this.list.unshift({
            name: '给自己买新电脑',
            price: 6999,
            payDate: new Date('2024-09-20')
          })
        })
        .margin(5)

      //会在底部添加
      Button('底部新增手机')
        .onClick(() => {
          this.list.push({
            name: '给自己买新手机',
            price: 3999,
            payDate: new Date('2024-09-20')
          })
        })
        .margin(5)

      //替换元素     splice(start: number, deleteCount: number, ...items: T[]): T[];
      Button('替换某个区间的元素为新元素')
        .onClick(() => {
          this.list.splice(1, 1, {
            name: '给自己买衣服',
            price: 88,
            payDate: new Date('2024-09-20')
          })
        })
        .margin(5)

    }
    .height('100%')
    .width('100%')

  }
}

@Component
struct ListDemo {
  build() {
    Column() {
      Row() {
        Text('支付记录')
      }.width('100%')
      .padding(20)
      .border({
        width: {
          bottom: 1
        },
        color: '#efefef'
      })
      .justifyContent(FlexAlign.Center)

      //Scroll更适合确定内容大小的滚动
      //List更适合多数据加载的滚动
      // 滚动组件：List -> ListItem
      List({ space: 20 }) {
        ListItem() {
          Column() {
            Row() {
              Text('给老婆买口红')
            }
            .width('100%')

            Row({ space: 20 }) {
              Text('￥399.00').fontColor(Color.Red)
              Text('2024/09/18')
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .justifyContent(FlexAlign.Start)
        }
        .padding(20)

        ListItem() {
          Column() {
            Row() {
              Text('给老婆买花')
            }
            .width('100%')

            Row({ space: 20 }) {
              Text('￥99.00').fontColor(Color.Red)
              Text('2024/09/19')
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .justifyContent(FlexAlign.Start)
        }
        .padding(20)

        ListItem() {
          Column() {
            Row() {
              Text('给自己买好吃的')
            }
            .width('100%')

            Row({ space: 20 }) {
              Text('￥999.00').fontColor(Color.Red)
              Text('2024/09/20')
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .justifyContent(FlexAlign.Start)
        }
        .padding(20)
      }
    }
  }
}

@Component
struct ListDemo2 {
  build() {
    List({ space: 20 }) {
      //ForEach(数据(数组)，结构体生成函数，键生成函数(可以不写) )
      //ForEach([],()=>{})
      ForEach([1, 2, 3, 4], () => {
        ListItem() {
          Column() {
            Row() {
              Text('给老婆买口红')
            }
            .width('100%')

            Row({ space: 20 }) {
              Text('￥399.00').fontColor(Color.Red)
              Text('2024/09/10')
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .justifyContent(FlexAlign.Start)
        }
      })
    }
  }
}

//创建数据类型
interface PayItemType {
  name: string,
  price: number,
  payDate: Date
}

//使用方式，在当前目录下打开命令行终端，输入以下命令
//i2c ./ForEachCase.ets

export class PayItemTypeModel implements PayItemType {
  name: string = ''
  price: number = 0
  payDate: Date = new Date()

  constructor(model: PayItemType) {
    this.name = model.name
    this.price = model.price
    this.payDate = model.payDate
  }
}
