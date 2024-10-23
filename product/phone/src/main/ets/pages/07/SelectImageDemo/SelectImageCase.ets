import { SelectIcon } from './builders/SelectIcon';
import MyCustomDialog from './components/MyCustomDialog';
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

  activeIndex: number = 0
  // 注册自定义弹层，要给builder初始值，任意类型
  myCustomDialogController: CustomDialogController = new CustomDialogController({
    //builder后面的有时要括号，有时不用括号，如这里的要用括号 builder: MyCustomDialog()
    builder: MyCustomDialog({
      selectList: this.selectedList,
      activeIndex: this.activeIndex
    }),
    //customStyle可不写，true为自定义样式
    customStyle: true
  })

  build() {
    Grid() {
      //回显已经勾选的图片
      ForEach(this.selectedList, (item: ResourceStr, index: number) => {
        //要用GridItem包裹一下
        GridItem() {
          Image(item).width('100%').aspectRatio(1)
        }
        .onClick(() => {
          //  打开自定义弹层
          this.myCustomDialogController.open()
          // 更新 activeIndex 为当前点击的下标，使得点击哪张就预览哪张
          this.activeIndex = index

          //写法2
          //ForEach(this.selectedList, (item: ResourceStr) => {
          // findIndex 查找数组中满足条的元素索引。find是查找数组中满足条件的第一个元素！
          // this.activeIndex = this.selectedList.findIndex((it) => {
          //   return item === it
          // })

        })
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