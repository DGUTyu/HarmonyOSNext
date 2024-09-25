import { SelectIcon } from './builders/SelectIcon';
import SelectImage from './components/SelectImage';

@Entry
@Component
struct SelectImageCase {
  @State
  showSelect: boolean = false
  // 选中并且点击确定的图片
  // 声明数据必须写在builder传递前！！！
  @State
  selectedList: ResourceStr[] = []

  // Builder要求：函数内部第一层必须是内置组件！！！
  @Builder
  ImageSelectBuilder() {
    //Builder里面也可以放组件，但是要包一层
    Column() {
      //@Link”修饰的“selectedList”必须通过组件构造函数初始化
      SelectImage({
        showSelect: this.showSelect,
        selectedList: this.selectedList,
        maxNum: 6
      })
    }
  }

  build() {
    Grid() {
      //回显已经勾选的图片
      ForEach(this.selectedList, (item: ResourceStr) => {
        //要用GridItem包裹一下
        GridItem() {
          Image(item).width('100%').aspectRatio(1)
        }
      })
      GridItem() {
        SelectIcon()
      }
      .onClick(() => {
        //打开模块框
        this.showSelect = true
      })
    }
    .height('100%')
    .width('100%')
    .padding(20)
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(10)
    .rowsGap(10)
    //第三个参数是配置样式的，不写的话也可以
    .bindSheet($$this.showSelect, this.ImageSelectBuilder, {
      showClose: false,
      height: '60%'
    })
  }
}