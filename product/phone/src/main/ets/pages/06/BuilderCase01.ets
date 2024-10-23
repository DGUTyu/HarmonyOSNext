import { LayoutBuilder, LayoutParamType } from './builders/LayoutBuilder';

@Entry
@Component
struct BuilderCase01 {
  @State
  configList: LayoutParamType[] = [
    {
      leftText: '异常位置',
      rightText: '广州'
    },
    {
      leftText: '异常时间',
      rightText: '2024-09-23'
    },
    {
      leftText: '异常类型',
      rightText: '超载'
    }
  ]

  build() {
    Column({ space: 20 }) {
      LayoutBuilderDemo1()
      ForEach(this.configList, (item: LayoutParamType) => {
        LayoutBuilder(item)
      })
    }
    .height('100%')
    .width('100%')
    .padding(20)
    .backgroundColor(Color.Gray)
  }
}

@Builder
function LayoutBuilderDemo1() {
  LayoutBuilder({
    leftText: '异常位置',
    rightText: '深圳'
  })
  LayoutBuilder({
    leftText: '异常时间',
    rightText: '2024-09-24'
  })
  LayoutBuilder({
    leftText: '异常类型',
    rightText: '宕机'
  })
}