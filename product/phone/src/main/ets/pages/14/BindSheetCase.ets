@Entry
@Component
struct BindSheetCase {
  /**
   * 模态转场是新的界面覆盖在旧的界面上，旧的界面不消失的一种转场方式。
   * 全模态和半模态弹层使用方式一样，第三个参数可以设置弹层的 modalTransition 显示模式
   */

  // 半模态转场显示隐藏控制
  @State isShowSheet: boolean = false;

  // 通过@Builder构建半模态展示界面
  @Builder
  mySheet() {
    Column() {
      Text('我是SheetBuilder')
        .fontSize(30)
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }

  build() {
    Column({ space: 20 }) {
      Text('BindSheetCase')
        .fontSize(28)
        .padding({ top: 30, bottom: 30 })

      Button('打开Sheet')
        .onClick(() => {
          this.isShowSheet = true
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f7f8')
    .bindSheet(this.isShowSheet, this.mySheet(), {
      height: 300,
      // 如果使用内置关闭按钮，手动改变开关
      onDisappear: () => {
        this.isShowSheet = !this.isShowSheet
      }
    })
  }
}