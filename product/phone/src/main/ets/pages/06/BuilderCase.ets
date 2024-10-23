@Entry
@Component
struct BuilderCase {
  /**
   * 如果你不想在直接抽象组件，ArkUI还提供了一种更轻量的UI元素复用机制
   * @Builder，可以将重复使用的UI元素抽象成一个方法，在 build 方法里调用。称之为自定义构建函数
   * 一般用于无状态的组件
   * 只要使用Builder修饰符修饰的内容，都可以做成对应的UI描述
   */

  // 组件内自定义构建函数 等价于 1.函数，里面放置的是结构 2.@Builder
  // 能不能传递参数？可以
  // 可不可以导出？可以
  // 只能组件内定义吗？还可以全局,推荐用组件内的，因为可以直接用到父组件的数据
  @Builder
  OptionLayout(optionText: string) {
    Row() {
      Text(optionText + this.parentOptionText).MyTextStyle()
    }
    .RowStyle()
  }

  @State
  parentOptionText: string = '父组件的文案'

  build() {
    Column({ space: 15 }) {
      Row() {
        Text('A.选项').MyTextStyle()
      }
      .RowStyle()

      // 状态+UI
      OptionChild()
      // 仅仅是UI结构的复用->自定义构建函数
      this.OptionLayout('C.选项')
      //全局的不用this
      LayoutFunc("标题", '内容')
    }
    .height('100%')
    .width('100%')
    .padding(20)
  }
}

//1.样式抽离 -> 公共样式的抽离
@Styles
function RowStyle() {
  .width('100%')
  .padding(20)
  .backgroundColor('#8d94a0')
  .borderRadius(8)
}

//2.定制样式的抽离 -> 组件扩展
@Extend(Text)
function MyTextStyle() {
  .fontColor(Color.White)
}

//3.结构的复用
@Component
struct OptionChild {
  @State
  myOptionText: string = 'B.选项'

  build() {
    Row() {
      Text(this.myOptionText).MyTextStyle()
    }
    .RowStyle()
  }
}

//5.全局自定义构建函数
@Builder
export function LayoutFunc(leftText: string, rightText: string) {
  // 和组件的区别：无状态的组件，不能有@State，主要是做一次渲染
  Row() {
    Text(leftText)
    Text(rightText)
  }.RowStyle()
  .justifyContent(FlexAlign.SpaceBetween)
}

//总结：结构的复用，UI的展示
//   1.自定义构建函数：组件内自定义构建函数(推荐)、全局自定义构建函数
//   2.语法：@Builder + 结构体函数
//   3.支持传参 + 支持导出