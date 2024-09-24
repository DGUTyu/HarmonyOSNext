@Entry
@Component
struct BuilderParamCase02 {
  @Builder
  MyRow() {
    Text('这是我自己定义的容器组件')
  }

  build() {
    Column() {
      //UI结构
      //支持多builderParam的写法
      //这种写法不支持预览，但是模拟器上是正常的
      BuilderParamChild02({
        MyRow:()=>{
          this.MyRow()
        }
      })

      //尾随闭包->只有一个builderParam
      BuilderParamChild02() {
        Text('这是我尾随闭包传进去的内容')
        Image($r('app.media.b'))
          .width(200)
      }
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct BuilderParamChild02 {
  @BuilderParam
  @Require
  //函数类型
  MyRow: () => void

  build() {
    Column(){
      Text('这是子组件的')
      this.MyRow()
    }
  }
}