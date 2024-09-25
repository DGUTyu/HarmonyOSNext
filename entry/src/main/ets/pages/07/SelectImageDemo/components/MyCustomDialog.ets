//@CustomDialog修饰的内容就是一个自定义弹层
// 1.声明弹层：comp组件将@Component替换成@CustomDialog,并且添加一个controller
// 2.注册弹层：注册给系统，从而实现系统返回能控制弹层
// 3.使用弹层:利用注册时候声明的Controller来控制！！
@CustomDialog
struct MyCustomDialog {
  //声明弹层
  controller: CustomDialogController
  // 如果传递的数据量不确定，最好还是用Link。因为@Prop会深拷贝
  @Link
  selectList: ResourceStr[]
  @Prop
  activeIndex: number = 0

  build() {
    Column() {
      Text('弹层内容')
      //轮播图
      Swiper() {
        ForEach(this.selectList, (item: ResourceStr) => {
          Image(item).width('100')
        })
      }
      .index($$this.activeIndex)
      .height(300)
      .width('100%')

      Text(`${this.activeIndex + 1}/${this.selectList.length}`).fontColor('#fff')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#d70e0404')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.controller.close()
    })
  }
}

export default MyCustomDialog