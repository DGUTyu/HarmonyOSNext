@Builder
export function SelectIcon() {
  Row() {
    Image($r('sys.media.ohos_ic_public_add'))
      .width(60)
      .aspectRatio(1)
      .fillColor(Color.Gray)
  }
  .width('100%')
  .aspectRatio(1)
  .border({
    width: 1,
    color: Color.Gray,
    //虚线
    style: BorderStyle.Dashed
  })
  .backgroundColor('#f5f7f8')
  .justifyContent(FlexAlign.Center)
}