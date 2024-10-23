@Preview
@Component
struct ZhReplyInput {
  @State
  content: string = ''
  publishContent: (content: string) => void = () => {
  }

  build() {
    Row() {
      TextInput({
        placeholder: '善语结善缘，恶语伤人心~',
        text: $$this.content
      })
        .layoutWeight(1)
        .onSubmit(() => {
          this.publishContent(this.content)
          this.content = ''
        })
      Button('发布')
        .onClick(() => {
          this.publishContent(this.content)
          this.content = ''
        })
    }.width('100%')
    .height(60)
    .padding({
      left: 12,
      right: 12
    })
  }
}

export default ZhReplyInput