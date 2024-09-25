@Component
struct SelectImage {
  // 所有的图片
  @State
  imageList: ResourceStr[] = [
    '/assets/1.webp',
    '/assets/2.webp',
    '/assets/3.webp',
    '/assets/4.webp',
    '/assets/5.webp',
    '/assets/6.webp',
    '/assets/7.webp',
    '/assets/8.webp',
    '/assets/9.webp',
    '/assets/10.webp',
  ]
  // 选择的图片
  @State
  selectList: ResourceStr[] = []
  // 选择并且点击确定了的图片
  @Link
  selectedList: ResourceStr[]
  @Link
  showSelect: boolean
  maxNum: number = 9

  build() {
    Column() {
      Row() {
        Text('取消')
          .onClick(() => {
            this.showSelect = false
          })
          .padding(10)
        Text(`已选中${this.selectList.length}/${this.maxNum}张`)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('确定')
          .onClick(() => {
            //   1.把选中的图片同步给父组件
            this.selectedList.unshift(...this.selectList)
            //   2.弹层一关
            this.showSelect = false
          })
          .padding(10)
      }.width('100%')
      .padding(20)

      Grid() {
        ForEach(this.imageList, (item: ResourceStr) => {
          GridItem() {
            Stack({ alignContent: Alignment.BottomEnd }) {
              //图片
              Image(item)
                .width('100%')
                .aspectRatio(1)
                .onClick(() => {
                  // 逻辑：
                  // 先判断是取消还是选中
                  // 取消：过滤出和点击不一样的就行
                  // 选中：有没有超出最大值？什么都不做：添加图片
                  if (this.selectList.includes(item)) {
                    // 取消选中：把和点击不一样的图全部晒选出来重组新数组
                    this.selectList = this.selectList.filter(img => img !== item)
                  } else {
                    // 如果没有超出限制！！
                    if (this.selectList.length < this.maxNum) {
                      // 将点击图片添加至数组
                      this.selectList.unshift(item)
                    }
                    // 否则什么都不做！
                  }
                })

              //勾选标志
              if (this.selectList.includes(item)) {
                Image($r('sys.media.ohos_ic_public_select_all'))
                  .width(24)
                  .aspectRatio(1)
                  .fillColor('#ff00ff0f')
                  .margin(6)
              }
            }
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
      .padding(20)
      //三列
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
    }

  }
}

export default SelectImage