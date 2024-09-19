@Entry
@Component
struct ConditionCase {
  @State
  isShow: boolean = false

  build() {
    Column() {
      Toggle({
        type: ToggleType.Switch,
        isOn: $$this.isShow
      })

      // 1.创建和销毁
      // 一个条件的时候：if(){}
      // 两个条件：if(){}else{}
      // 多个条件
      // if(){}else if(){}else{}
      // if(){}else if()else if(){}

      // if (this.isShow) {
      //   Image('https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png')
      //     .width(60)
      // } else {
      //   Image($r('app.media.b'))
      //     .width(60)
      // }

      // 2.属性控制显示隐藏
      Image('https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png')
        .width(60)
        //.visibility(this.isShow ? Visibility.Visible : Visibility.Hidden)
        .visibility(this.isShow ? Visibility.Visible : Visibility.None)
      //   visibility  -1.visible显示  2.hidden隐藏，但是占用位置 3.None会销毁
      Image($r('app.media.b'))
        .width(60)
    }
    .height('100%')
    .width('100%')
  }
}