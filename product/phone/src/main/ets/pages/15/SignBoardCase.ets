import { fileIo } from '@kit.CoreFileKit'
import { buffer } from '@kit.ArkTS'

@Entry
@Component
struct SignBoardCase {
  myPen: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true))
  @State
  imageUrl: string = ''
  @State
  canvasWidth: number = 0
  @State
  canvasHeight: number = 0

  build() {
    Column({ space: 20 }) {
      Canvas(this.myPen) {

      }
      .width('100%')
      .height(350)
      .backgroundColor(Color.Pink)
      .onTouch((event) => {
        if (event.type === TouchType.Down) {
          //   手指按下
          this.myPen.beginPath()
          this.myPen.moveTo(event.touches[0].x, event.touches[0].y)
        } else if (event.type === TouchType.Move) {
          //   移动
          this.myPen.lineTo(event.touches[0].x, event.touches[0].y)
          this.myPen.stroke()
        } else if (event.type === TouchType.Up) {
          //   手指抬起
          this.myPen.closePath()
        }
      })
      .onAreaChange((_, _new) => {
        this.canvasWidth = _new.width as number
        this.canvasHeight = _new.height as number
      })

      if (this.imageUrl) {
        Image(this.imageUrl).width('100%')
      }

      Row({ space: 20 }) {
        Button('重签')
          .onClick(() => {
            this.myPen.clearRect(0, 0, this.canvasWidth, this.canvasHeight)
          })

        Button('保存')
          .onClick(() => {
            // 将画笔的base64转buffer存入新建的文件
            // /data/app/el2/100/base/cn.android.harmonyosnext/haps/phone/files/1731492193485.jpg
            const imageUrl = this.myPen.toDataURL('image/jpg')
            const filePath = getContext().filesDir + '/' + Date.now() + '.jpg'
            const file = fileIo.openSync(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE)
            const image64 = imageUrl.split(';base64,').pop()
            const imgBuffer = buffer.from(image64, 'base64')
            fileIo.writeSync(file.fd, imgBuffer.buffer)
            fileIo.closeSync(file)

            //   写入沙箱
            this.imageUrl = 'file://' + filePath
          })
      }

    }
    .height('100%')
    .width('100%')
  }
}