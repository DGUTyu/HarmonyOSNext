@Entry
@Component
struct Condition2Case {
  @State
  selectedIndex: number = 0
  @State
  optionValue: string = '未开通'

  build() {
    Column() {
      Row({ space: 10 }) {
        Text('开通会员')
        Select([{ value: '未开通' }, { value: 'VIP' }, { value: 'SVIP' }])
          .width('50%')
            //选中的下标，从0开始
          .selected($$this.selectedIndex)
            //当前下拉框显示的内容
          .value($$this.optionValue)
      }

      Row({ space: 20 }) {
        Image($r('app.media.b'))
          .width(60)
          .borderRadius(30)
        Text('深圳吴彦祖')
        if (this.selectedIndex === 0) {
          Text(this.optionValue)
            .VIPStyle()
            .backgroundColor('#ccc')
        } else if (this.selectedIndex === 1) {
          Text(this.optionValue)
            .VIPStyle()
            .backgroundColor('#ffffb921')
        } else if (this.selectedIndex === 2) {
          Text(this.optionValue)
            .VIPStyle()
            .backgroundColor('#ffbc0303')
        }

      }
    }
    .height('100%')
    .width('100%')
  }
}

@Extend(Text)
function VIPStyle() {
  .padding({
    right: 20,
    left: 20,
    top: 4,
    bottom: 4
  })
  .fontColor('#fff')
  .borderRadius(20)
  .fontSize(12)
}