@Entry
@Component
struct ComAnCase {
  /**
   * 组件内元素专场transition
   * 组件内转场主要通过transition属性配置转场参数，在组件插入和删除时显示过渡动效，
   * 主要用于容器组件中的子组件插入和删除时，提升用户体验。
   *
   * 4.0中的我们使用的transitionOption的属性被废弃了，新增了TransitionEffect的属性设置方式
   *
   * 语法
   * .transition(TransitionEffect.SLIDE.animation({
   *  duration: 1000
   * }).combine(TransitionEffect.rotate({
   *  angle: -180
   * })).combine(TransitionEffect.translate({
   *  x: '-100%'
   * })))
   * 有三种模式可选
   * OPACITY      指定透明度为0的转场效果
   * SLIDE        指定出现时从左侧滑入、消失时从右侧滑出的转场效果
   * SLIDE_SWITCH 指定出现时从右先缩小再放大侧滑入、消失时从左侧先缩小再放大滑出的转场效果
   *
   */
  @State
  showImage: boolean = false

  build() {
    Row() {
      Column({ space: 20 }) {
        Column() {
          if (this.showImage) {
            Image($r("app.media.b"))
              .width(100)
              .height(100)
              .borderRadius(50)
              .transition(
                TransitionEffect
                  .translate({ x: '-200%' })
                  .animation({ duration: 2000 })
                  .combine(
                    TransitionEffect
                      .rotate({ angle: 360 })
                      .animation({ duration: 1000 })
                  )
              )
          }
        }
        .height(100)

        Button("显示/隐藏")
          .onClick(() => {
            this.showImage = !this.showImage
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}