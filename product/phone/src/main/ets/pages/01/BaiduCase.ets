@Entry
@Component
struct BaiduCase {
  build() {
    Column({ space: 12 }) {
      /**
       * Stack的参数 可以设置子组件的排列方式-alignContent
       ● Top(顶部)
       ● TopStart（左上角）
       ● TopEnd（右上角）
       ● Start（左侧）
       ● End（右侧）
       ● Center（中间）
       ● Bottom（底部）
       ● BottomStart（左下角）
       ● BottomEnd(右下角)
       */
      Stack() {
        Image('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
          .width(160)
          .backgroundColor(Color.Gray)
        Text('鸿蒙版')
          .fontSize(12)
          .translate({
            x: +50
          })
        //秘诀：后一个永远盖在前一个上面
        //Text('Plus')
      }

      Row() {
        TextInput()
          .border({
            width: 2,
            color: Color.Gray
          })
          .borderRadius({
            bottomLeft: 6,
            topLeft: 6
          })
          .backgroundColor(Color.White)
          .layoutWeight(1)
          .height(40)

        Button('百度一下')
          .type(ButtonType.Normal)
          .borderRadius({
            topRight: 6,
            bottomRight: 6
          })
          .height(40)
          .translate({
            x: -2
          })
          .padding(10)
      }
    }

  }
}