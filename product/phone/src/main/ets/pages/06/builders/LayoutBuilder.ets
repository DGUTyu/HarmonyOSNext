@Builder
export function LayoutBuilder(param: LayoutParamType) {
  Row() {
    Text(param.leftText)
    Text(param.rightText)
  }
  .width('100%')
  .padding({
    left: 20,
    right: 20
  })
  .height(48)
  .borderRadius(8)
  .justifyContent(FlexAlign.SpaceBetween)
  .backgroundColor(Color.White)
}

export interface LayoutParamType {
  leftText: string,
  rightText: string
}