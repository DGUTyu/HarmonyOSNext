// 1.如果是一个页面必须有且只有一个@Entry
// 如果是组件，main_pages.json中不能出现改文件的路由信息
@Entry
  // 2.不论是页面还是组件，都必须要用这个装饰器
@Component
  // 3.都必须要用struct关键字来声明
struct FirstPageCase {
  // 4.必须要有一个build函数
  build(){
    // 内置组件
    Column(){
      // 如果一个组件里面还可以放置另一个组件，那么这个组件就可以理解为容器组件
      Text('鸿蒙太好玩了'){
        // 这个不会显示
        Span('确实好玩！')
      }
      Text('真的好玩吗？？')
      // 使用自定义组件
      FirstComp()
    }
  }
}

// 自定义组件 快捷键comp：生成组件
// 1.@Component修饰器
@Component
  // 2.关键字声明
struct FirstComp {
  // 3.build函数
  build() {
    // 参数
    Column({space:20}){
      Text('1')
      Text('2')
      SecondComp()
    }
    // 属性
    .backgroundColor(Color.Pink)
  }
}

@Component
struct SecondComp {
  build() {
    Column(){
      Text('3')
      Text('4')
    }
  }
}