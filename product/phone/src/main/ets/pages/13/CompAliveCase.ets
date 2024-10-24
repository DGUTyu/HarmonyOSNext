//页面级组件
import { Theme } from '@ohos.arkui.theme';

@Entry
@Component
struct CompAliveCase {
  @State
  selfFontColor: ResourceColor = '#ff00ff'

  //点击返回时：onPageShow-onBackPress-onPageHide

  //周期：页面展示时触发
  onPageShow(): void {
    console.log('CompAliveCase', 'onPageShow')
  }

  //周期：页面隐藏时触发
  onPageHide(): void {
    console.log('CompAliveCase', 'onPageHide')
  }

  //周期：进行路由返回（代码+物理键）时触发
  onBackPress(): boolean | void {
    console.log('CompAliveCase', 'onBackPress')
  }

  //主题设置第4步：应用主题
  onWillApplyTheme(theme: Theme): void {
    // 用于获取当前组件上下文的Theme对象，在创建自定义组件的新实例后，在执行其build()函数之前执行。
    // 允许在onWillApplyTheme函数中改变状态变量，更改将在后续执行build()函数中生效。
    // this.selfFontColor = theme.colors.fontPrimary
  }

  //周期：页面内容的构建
  build() {
    Column() {
      Text('青青的草原1')
        .fontColor(this.selfFontColor)
      AliveComp()
    }
  }
}

//普通组件
@Component
struct AliveComp {
  //页面特有的周期，可以写，组件是不会执行的！
  onPageShow(): void {
    console.log('CompAliveCase AliveComp', 'onPageShow不会打印')
  }

  onPageHide(): void {
    console.log('CompAliveCase AliveComp', 'onPageHide不会打印')
  }

  onBackPress(): boolean | void {
    console.log('CompAliveCase AliveComp', 'onBackPress不会打印')
  }

  //组件进行绘制前
  aboutToAppear(): void {
    //周期：还没执行build 即将执行build
    //功能：数据状态的处理，定时器的开启
  }

  aboutToDisappear(): void {
    //周期：即将销毁组件
    //功能：数据状态的处理（销毁~避免内存泄露），定时器的关闭
    //清理~标记引用法（需要将标记引用了，但是实际没有用的内容进行情理）
  }

  aboutToReuse(): void {
    //周期：组件复用的生命周期 (API10新增)
    //功能：内存数据处理
  }

  aboutToRecycle(): void {
    //周期：组件复用的生命周期 (API10新增)
    //功能：恢复到节点树之前
  }

  onWillApplyTheme(theme: Theme): void {
    //获取当前组件上下文的主题色 (API12新增)
  }

  onDidBuild(): void {
    //周期：build函数执行完毕
    //进行UI响应式更新-重构（bug）
    //不建议在onDidBuild函数中更改状态变量、使用animateTo等功能，这可能会导致不稳定的UI表现。
    //没什么用
  }

  build() {
    Text('青青的草原2')
  }
}