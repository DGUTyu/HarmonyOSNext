@Entry
@Component
struct Index {
  //要在phone的设置里勾选 Deploy Multi Hap
  @State message: string = 'HSP_index page';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}