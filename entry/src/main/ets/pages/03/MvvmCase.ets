@Entry
@Component
struct MvvmCase {
  // ● 双向绑定
  // 数据-视图
  //   ● 数据驱动视图
  //   ● 视图中的内容发生变化-数据也会同步修改
  //   ● MVVM-M-V-VM
  //   ● Model数据模型
  //   ● V-View视图
  //   ● VM- ViewModel 桥梁

  //在鸿蒙Next版本中，推出了一系列双向绑定的组件
  //● 双向绑定- 数据和视图双向同步-数据变化-视图更新，视图更新，-数据更新
  //● 鸿蒙Next版本所支持的所有双向绑定组件
  // Checkbox、CheckboxGroup、DatePicker、TimePicker、
  // MenuItem、Panel、Radio、Rating、
  // Toggle、AlphabetIndexer、Select、BindSheet、
  // BindContentCover、Refresh、Search、SideBarContainer、
  // Slider、Stepper、Swiper、Tabs、
  // TextArea、TextInput、TextPicker、
  // ● 双向绑定语法
  // $$语法：内置组件双向同步
  // ● 当前$$支持基础类型变量，以及@State、@Link和@Prop装饰的变量。
  // 如果绑定TextInput组件，如 TextInput({ text: $$this.xxx })
  //
  // 值得注意的是：上述组件中有的双向组件是属性，有的双向绑定是参数
  // ● 参数是在组件({ text: $$this.xx })
  // ● 属性是在组件().text($$this.xxx)
  // ● 不支持嵌套数据的双向绑定如 组件({ text: $$this.xx.xx })

  // 总结：双向数据绑定 $$ = 1.数据驱动视图@State 2.视图更新数据(事件)


  build() {
    Scroll() {
      Column({ space: 10 }) {
        bindDemo1()
        bindDemo2()
      }
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct MyDivider {
  build() {
    Divider().height(3).backgroundColor(Color.Pink)
  }
}

@Component
struct bindDemo1 {
  // 1.数据驱动视图
  @State
  isChecked: boolean = true
  @State
  myDate: Date = new Date('2024-09-01')
  @State
  myText: string = '123'
  @State
  //接口的赋值需要加上引号
  userInfo: UserInfoType = {
    name: '张三',
    age: '18'
  }

  build() {
    Column({ space: 10 }) {
      Checkbox()//默认圆形，这里设置为带圆角的正方形
        .shape(CheckBoxShape.ROUNDED_SQUARE)// 语法糖：少量代码实现复杂的功能
        .select($$this.isChecked)
        .borderRadius(10)
        .onChange((value) => {
          // 2.视图更新数据
          this.isChecked = value
        })

      Text('' + this.isChecked)
      //Toggle({ type: ToggleType.Checkbox, isOn: this.isChecked })
      Toggle({ type: ToggleType.Checkbox, isOn: $$this.isChecked })
      Text('' + this.myDate)
      DatePicker({ selected: $$this.myDate })
      Text('' + this.myText)
      TextInput({ text: $$this.myText })

      Divider()
      // 注意：不能拿对象的属性双向数据绑定
      //TextInput({text:$$this.userInfo.name})
    }
  }
}

//测试几个正常的双向绑定
@Component
struct bindDemo2 {
  @State
  isChecked: boolean = true
  @State
  myDate: Date = new Date('2024-09-01')
  @State
  myRadio: boolean = false
  @State
  mySearch: string = ''
  @State
  myToggle: boolean = false
  @State
  mySelect: string = '请选择'

  build() {
    Column({ space: 12 }) {
      Column() {
        Text('Checkbox双向绑定')
        Checkbox().select($$this.isChecked)
        Text('' + this.isChecked)
      }

      MyDivider()
      Column() {
        Text('DatePicker双向绑定')
        DatePicker({ selected: $$this.myDate })
        Text('' + this.myDate)
      }

      MyDivider()
      Column() {
        Text('Radio双向绑定')
        Row({ space: 5 }) {
          Radio({ value: 'radio', group: 'radioSelect' })
            .checked($$this.myRadio)
          Radio({ value: 'radio2', group: 'radioSelect' })
          Radio({ value: 'radio3', group: 'radioSelect3' })
          Radio({ value: 'radio4', group: 'radioSelect3' })
        }

        Text('第一个radio：' + this.myRadio)
      }

      MyDivider()
      Column() {
        Text('Search双向绑定')
        Search({ value: $$this.mySearch })
        Text('' + this.mySearch)
      }

      MyDivider()
      Column() {
        Text('Toggle双向绑定')
        Toggle({ type: ToggleType.Switch, isOn: $$this.myToggle })
        Text('' + this.myToggle)
      }

      MyDivider()
      Column() {
        Text('Select双向绑定')
        Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }, { value: 'ddd' }])
          .value($$this.mySelect)
        Text('' + this.mySelect)
          .margin({
            bottom: 20
          })
      }
    }
  }
}

interface UserInfoType {
  name: string
  age: string
}