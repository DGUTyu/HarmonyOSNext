//1.只能手动引入小写的animator
import animator, { AnimatorOptions, AnimatorResult } from '@ohos.animator'

@Entry
@Component
struct AnimatorCase {
  @State
  angle: number = 0
  timer: number = -1
  isPlay: boolean = false
  //动画配置
  myAnimatorOptions: AnimatorOptions = {
    //通用配置-动画效果的配置
    //时长，单位毫秒
    duration: 10 * 1000,
    //动画插值曲线 linear ease ease-in ease-out ease-in-out fast-out-slow-in linear-out-slow-in fast-out-linear-in等等
    easing: "liner",
    //动画延时播放时长，单位毫秒
    delay: 0,
    //动画执行后是否恢复到初始状态 "none" | "forwards" | "backwards" | "both"
    fill: 'backwards',
    //动画播放模式。"normal" | "reverse" | "alternate" | "alternate-reverse"
    direction: 'normal',
    //动画播放次数。设置为0时不播放，设置为-1时无限次播放。说明: 设置为除-1外其他负数视为无效取值，无效取值动画默认播放1次。
    iterations: -1,

    //核心配置-动画实现的配置
    //开始 动画插值起点。 默认值:0。
    begin: 0,
    //结束 动画插值终点。 默认值:1
    end: 360
  }
  //2.创建动画遥控器
  myAnimator: AnimatorResult = animator.create(this.myAnimatorOptions)

  aboutToAppear(): void {
    //onFrame是动画执行时的结果
    this.myAnimator.onFrame = (value) => {
      //每一帧的值赋值给angle
      this.angle = value
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('AnimatorCase')
      Image($r('app.media.b'))
        .width(200)
        .aspectRatio(1)
        .borderRadius(100)
        .rotate({
          angle: this.angle
        })

      // Button('播放/暂停')
      //   .onClick(() => {
      //     if (this.timer !== -1) {
      //       clearInterval(this.timer)
      //       this.timer = -1
      //     } else {
      //       this.timer = setInterval(() => {
      //         this.angle++;
      //         if (this.angle === 360) {
      //           this.angle = 0
      //         }
      //       }, 30);
      //     }
      //   })

      Button('myAnimator播放/暂停')
        .onClick(() => {
          this.isPlay = !this.isPlay
          this.isPlay ? this.myAnimator.play() : this.myAnimator.pause()
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}