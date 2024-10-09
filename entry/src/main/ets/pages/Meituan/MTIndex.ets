import MTCart from './components/MTCart';
import MTFooter from './components/MTFooter';
import MTHeader from './components/MTHeader';
import MTMain from './components/MTMain';

@Entry
@Component
struct MTIndex {
  @Provide showCart: boolean = false

  //组件生命周期有一个方法叫onBackPress，可以在Index监听这个方法进行关闭
  // onBackPress() {
  //   //保留当前页面
  //   return true
  // }

  //写法1
  // onBackPress() {
  //   if (this.showCart) {
  //     this.showCart = false
  //     //保留当前页面
  //     return true
  //   }
  //   return false
  // }

  //写法2
  onBackPress(): boolean | void {
    if (this.showCart) {
      this.showCart = false
      //保留当前页面
      return true
    }
  }

  build() {

    //Stack默认居中对齐
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        MTHeader()
        MTMain()
          .layoutWeight(1)
      }
      .height('100%')
      .width('100%')

      //这里MTCart要放在MTBottom前面 利用层级的先后关系实现底部内容挡在购物车前面的效果
      if (this.showCart) {
        MTCart()
      }
      MTFooter()
    }
    .height('100%')
    .width('100%')
  }
}