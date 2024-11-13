@Entry
@Component
struct CanvasCase {
  /**
   * ● ArkUI里面的画布和前端的Canvas的用法基本一致
   * ● 使用方法
   * 1. 放置Canvas组件-给宽和高
   * 2. 初始化画笔对象 CanvasRenderingContext2D，将画笔对象作为构造参数传递给Canvas组件
   * 3. 可以在Canvas的onReady事件中进行动态绘制
   * 4. 绘制方法官方文档 https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/ts-canvasrenderingcontext2d-V5?catalogVersion=V5
   *
   * 贝塞尔曲线：多个点路径相同时间到达组成的线进行连接，连接后组成线继续连接，直到最后一根线，以相同时间从点到终点的运动轨迹
   * 掌握三次贝塞尔曲线等于掌握二次贝塞尔曲线
   */

  // 2.准备一个笔，并且和画布关联
  myPen: CanvasRenderingContext2D = new CanvasRenderingContext2D()
  @State
  canvasWidth: number = 0
  @State
  canvasHeight: number = 0

  // 绘制：线
  drawLine() { //蓝色倒三角
    //起始 beginPath
    this.myPen.beginPath()
    // 笔离开画布的移动
    this.myPen.moveTo(100, 100)
    // 笔不离开画布的移动
    //this.myPen.lineTo(100, 100)
    // 核心开始
    // 画笔的颜色，粗细
    this.myPen.strokeStyle = 'blue'
    this.myPen.fillStyle = 'red'
    this.myPen.lineWidth = 4
    // 笔挨着画布移动
    this.myPen.lineTo(200, 200)
    this.myPen.lineTo(300, 100)
    this.myPen.lineTo(100, 100)
    // 绘制(空心)执行
    this.myPen.stroke()
    // 绘制(填充)
    this.myPen.fill()
    // 核心结束
    //结束 closePath
    this.myPen.closePath()
  }

  // 绘制：矩形
  drawRect() {
    this.myPen.beginPath()
    this.myPen.moveTo(300, 0)
    this.myPen.strokeStyle = 'blue'
    this.myPen.fillStyle = 'red'
    this.myPen.lineWidth = 4
    //x，y 轴坐标,矩形的宽度,高德
    this.myPen.strokeRect(30, 0, 30, 30)
    this.myPen.fillRect(0, 0, 30, 30)
    this.myPen.closePath()
  }

  // 绘制：圆，圆弧，扇形，圆环
  drawCircle() {
    this.myPen.beginPath()
    this.myPen.moveTo(250, 100)
    this.myPen.fillStyle = '#ff00ff0f'
    // 绘制的路径和线一样
    // x（圆心）的x轴坐标, y（圆心）的y轴坐标, radius半径,
    // 圆弧的起点，开始在x轴方向上计算，单位为弧度，从圆心的3点钟顺时针开始计算
    // startAngle起点弧度 , endAngle结束弧度, counterclockwise?: boolean
    this.myPen.arc(250, 100, 50, 0, 6.3)
    this.myPen.fill()
    this.myPen.closePath()
  }

  // 绘制：曲线
  drawBezierCurve() {
    this.myPen.beginPath()
    this.myPen.moveTo(100, 300)
    this.myPen.strokeStyle = '#ff00ff'
    this.myPen.lineWidth = 2;
    // 三次贝塞尔的三个点坐标
    // cp1x-第一个控制点的x轴坐标。
    // cp1y-第一个控制点的y轴坐标。
    // cp2x-第二个控制点的x轴坐标。
    // cp2y-第二个控制点的y轴坐标。
    // x-终点的x轴坐标。
    // y-终点的y轴坐标。
    this.myPen.bezierCurveTo(195, 50, 420, 129, 367, 30);
    this.myPen.stroke();
    // 绘制的路径和线一样
    this.myPen.closePath()
  }

  // 绘制：文字
  drawText() {
    this.myPen.beginPath()
    this.myPen.strokeStyle = '#ffeaf82a'
    this.myPen.moveTo(0, 300)
    this.myPen.font = '100px 微软雅黑'
    this.myPen.strokeText('精忠报国', 0, 300)
    this.myPen.closePath()
  }

  // 绘制：图片
  drawImage() {
    this.myPen.beginPath()
    this.myPen.drawImage(new ImageBitmap('/assets/1.webp'), 0, 0)
    this.myPen.closePath()
  }

  // 清空画布
  drawClear() {
    this.myPen.clearRect(0, 0, this.canvasWidth, this.canvasHeight)
  }

  build() {
    Column() {
      //1.准备画布
      Canvas(this.myPen)
        .width('100%')
        .height(400)
        .backgroundColor(Color.Pink)
        .onReady(() => {
          // 可以进行绘制了。注意绘制顺序，会覆盖
          this.drawImage()
          this.drawLine()
          this.drawRect()
          this.drawCircle()
          this.drawBezierCurve()
          this.drawText()
        })
        .onAreaChange((_, _val) => {
          this.canvasWidth = _val.width as number
          this.canvasHeight = _val.height as number
        })

      Flex({ wrap: FlexWrap.Wrap }) {
        Button('清空')
          .onClick(() => {
            this.drawClear()
          })
        Button('画线')
          .onClick(() => {
            this.drawLine()
          })
        Button('画圆')
          .onClick(() => {
            this.drawCircle()
          })
        Button('画矩形')
          .onClick(() => {
            this.drawRect()
          })
        Button('画曲线')
          .onClick(() => {
            this.drawBezierCurve()
          })
        Button('画文字')
          .onClick(() => {
            this.drawText()
          })
        Button('画图')
          .onClick(() => {
            this.drawImage()
          })
      }.width('100%')
    }
    .height('100%')
    .width('100%')
  }
}