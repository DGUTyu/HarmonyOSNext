@Entry
@Component
struct AddressCase {
  // 1.创建数据，将数据渲染至UI界面
  // 区别：
  // 如果一个对象是已有的，可以用interface也可以用class
  // 如果一个对象刚开始是没有的，需要创建，就只能用class
  // 接口
  // @State
  // userInfo:IPerson = {
  //   name: '张三',
  //   age: 18,
  //   gender: '男',
  //   address: {
  //     province: '陕西',
  //     city: '西安',
  //     area: '未央'
  //   }
  // }
    // interface可以直接赋值字面量对象

  // 类
  // 2.数据更新时UI自动更新

  @State
  //类必须new才可以
  userInfo: IPersonModel = new IPersonModel({
    name: '张三',
    age: 18,
    gender: '男',
    address: {
      province: '陕西',
      city: '西安',
      area: '未央'
    }
  })

  build() {
    Column({ space: 10 }) {
      Row({ space: 10 }) {
        Text('姓名：')
        TextInput({ text: this.userInfo.name }).layoutWeight(1)
      }

      Row({ space: 10 }) {
        Text('年龄：')
        TextInput({ text: this.userInfo.age.toString() }).layoutWeight(1)
      }

      Row({ space: 10 }) {
        Text('性别：')
        Select([{ value: '男' }, { value: '女' }]).layoutWeight(1)
          //.selected(this.userInfo.gender) //会报错，应该传number | Resource
          //第一个下标为0
          //.selected(0)
          .value(this.userInfo.gender)
      }

      Row({ space: 10 }) {
        Text('地址：')
        Row({ space: 10 }) {
          TextInput({ text: this.userInfo.address.province }).layoutWeight(1)
          TextInput({ text: this.userInfo.address.city }).layoutWeight(1)
          TextInput({ text: this.userInfo.address.area }).layoutWeight(1)
        }
      }

      Row({ space: 10 }) {
        Button('修改姓名').onClick(() => {
          //1.修改数据
          this.userInfo.name = '李四'
        })

        Button('修改性别').onClick(() => {
          this.userInfo.gender = '女'
        })

        Button('修改地址').onClick(() => {
          // 必须遵循原则：只有自己或者第一层发生变化@State才能检测到！！！
          this.userInfo.address.area = '高新'
          //数据变了没？  this.userInfo.address === { province:陕西，city：西安，area:高新 }
          // new IAddressModel(this.userInfo.address)会得到一个数据一模一样的新对象
          // 把这个新对象再赋值给原来的地方就实现了改了第一层
          this.userInfo.address = new IAddressModel(this.userInfo.address)
          // 把这个新对象再赋值给原来的对象就实现了改了自己
          // this.userInfo = new IPersonModel(this.userInfo)
          // interface实现 --- 需要手写对象，麻烦，用class直接改了属性new就可以得到对象了
          // this.userInfo.address = {
          //   province:'陕西',
          //   city:'西安',
          //   area:'高新'
          // }
        })
      }

      // Row(){
      //   Text(JSON.stringify(this))
      // }
    }
    .height('100%')
    .width('100%')
    .padding(10)
  }
}


//1.对象类型：interface
interface IAddress {
  province: string
  city: string
  area: string
}

interface IPerson {
  name: string
  age: number
  //联合类型
  gender: '男' | '女'
  address: IAddress
}

// 2.对象类型：class
// class和interface的区别，有初始值
// 可以借助工具把interface转为class
//下载nodejs
//https://nodejs.org/zh-cn/download/prebuilt-binaries
//解压，配置环境变量
//D:\node-v21.7.3-win-x64
//检查版本
//node -v
//安装插件
//npm i -g interface2class
//测试是否安装成功
//i2c -V
//使用方式，在当前目录下打开命令行终端，输入以下命令
//i2c ./AddressCase.ets

export class IAddressModel implements IAddress {
  province: string = ''
  city: string = ''
  area: string = ''

  constructor(model: IAddress) {
    this.province = model.province
    this.city = model.city
    this.area = model.area
  }
}

export class IPersonModel implements IPerson {
  name: string = ''
  age: number = 0
  gender: '男' | '女' = '男'
  address: IAddress = new IAddressModel({} as IAddress)

  constructor(model: IPerson) {
    this.name = model.name
    this.age = model.age
    this.gender = model.gender
    this.address = model.address
  }
}
