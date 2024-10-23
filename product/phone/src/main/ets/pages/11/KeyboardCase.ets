@Entry
@Component
struct KeyboardCase {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Row()
        .width('100%')
        .height(50)
        .backgroundColor(Color.Pink)
      Row() {
        Grid() {
          GridItem() {
            Text('sjladlsajdlksajdlsajdljsadlajsldjasldjasdjsldjalsjdlsajdlkjslkjdalsjdlsajdlaskjd')
          }
        }
      }
      .height('70%')
      .width('100%')
      .backgroundImage($r('app.media.b'))
      .backgroundImageSize({
        width: '100%',
        height: '100%'
      })

      Row() {
        TextInput()
          .layoutWeight(1)
      }
      .width('100%')
      .padding(12)
    }
    .height('100%')
    .width('100%')
  }
}