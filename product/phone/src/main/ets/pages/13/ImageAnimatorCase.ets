@Entry
@Component
struct ImageAnimatorCase {
  /**
   * 图片帧动画
   * 使用ImageAnimator组件实现逐帧播放图片的能力，可以配置需要播放的图片列表，每张图片可以配置时长
   *
   * 通过state属性可以控制图片的动画的执行方式
   * AnimationStatus.Initial 初始化   -  不播放动画
   * AnimationStatus.Running 播放中   -  播放动画
   * AnimationStatus.Paused 暂停   -  暂停动画至当前帧
   *
   * 生成一个长度为10的数组：
   * Array(10)
   * 设置数组每一项的内容：
   * Array.form(Array(10),(item,index)=>{
   * return  `${index}`
   * })
   */
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        ImageAnimator()
          .images(Array.from(Array(37), (item: string, index: number) => {
            //图片路径不能含中文
            return { src: `/assets/JDLoading/loading_${index}.png` } as ImageFrameInfo
          }))
          .duration(3000)
          .state(AnimationStatus.Running)
          .fillMode(FillMode.None)
          .iterations(-1)
            //必须有宽高
          .width(340)
          .aspectRatio(1)
      }.width('100%')
    }
    .height('100%')
  }
}