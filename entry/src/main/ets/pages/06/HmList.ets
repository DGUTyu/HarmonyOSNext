@Preview
@Component
struct HmList {
  @Builder
  defaultRow() {
    Image($r('sys.media.ohos_ic_compnent_titlebar_back'))
  }

  @State
  // 不知道传入的是什么类型 统一认为是object
  list: object[] = []
  @BuilderParam
  renderItem: (obj: object) => void = this.defaultRow

  build() {
    // Grid List WaterFlow
    // 渲染数组
    List({ space: 10 }) {
      ForEach(this.list, (item: object) => {
        ListItem() {
          //自定义的结构
          if (this.renderItem) {
            this.renderItem(item)
            // 函数中的this始终指向调用者
          }
        }
      })
    }
    .padding(20)
  }
}

export default HmList

// WaterFlow FlowItem  Grid GirdItem  List ListItem