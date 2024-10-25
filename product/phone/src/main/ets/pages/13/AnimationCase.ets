@Entry
@Component
struct AnimationCase {
  /**
   * 系统可动画属性：
   * 分类        说明
   * 布局属性     位置、大小、内边距、外边距、对齐方式、权重等。
   * 仿射变换     平移、旋转、缩放、锚点等。
   * 背景        背景颜色、背景模糊等。
   * 内容        文字大小、文字颜色，图片对齐方式、模糊等。
   * 前景        前景颜色等。
   * Overlay    Overlay属性等。
   * 外观        透明度、圆角、边框、阴影等。
   *
   * 属性动画的实现方式有三种
   * ● animation属性
   * ● animateTo函数
   * ● @animator工具类(重点掌握)
   *
   * 通过animation属性
   * 识别组件的可动画属性变化，自动添加动画。
   * 组件的接口调用是从下往上执行，animation只会作用于在其之上的属性调用。
   * 组件可以根据调用顺序对多个属性设置不同的animation。
   *
   * 使用animateTo函数
   * animateTo(value: AnimateParam, event: () => void): void
   * 原理
   * 通用函数，对闭包前界面和闭包中的状态变量引起的界面之间的差异做动画。支持多次调用，支持嵌套。
   * 解释： 不论是组件的显示隐藏还是属性的变化，使用animateTo都可以实现动画
   *
   * 通过@animator
   * 之前两种方式都使用于单次执行动画，如果有一个动画需要重复执行，并且还需要开关控制，
   *
   * animator使用步骤：
   * ● 1.手动引入animator
   * ● 2.准备AnimatorOptions的动画参数
   * ● 3.创建AnimatorResult类型的动画类
   * ● 4.监听动画的结果更新UI
   */
  @State message: string = 'Hello World';
  @State
  fontSize: number = 50

  build() {
    Column() {
      Text(this.message)
        .width(this.fontSize * 6)
        .backgroundColor(Color.Gray)
        .id('AnimationCaseHelloWorld')
        .fontSize(this.fontSize)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      //方式1：属性动画:定义动画的配置。只要加了animation，所有支持属性动画的动画属性都会在这个时间内进行变化
      //缺点：一棍子打死
      // .animation({
      //   //动画时长：900毫秒
      //   duration:900
      //   //重复次数，-1代表不重复 iterations
      //   //动画曲线 curve:Curve.Smooth
      //   //延迟时间 delay
      //   //播放模式 playMode:PlayMode.Alternate
      // })

      // Button('变小-使用动画属性')
      //   .onClick(() => {
      //     this.fontSize = 20;
      //   })

      //方式2：动画方法
      // Button('变小-使用animateTo函数')
      //   .onClick(() => {
      //     animateTo({ duration: 900 }, () => {
      //       this.fontSize = 20;
      //     })
      //   })

      //this.btnChangeFontSizeDemo()
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  btnChangeFontSizeDemo() {
    Button('变大')
      .onClick(() => {
        this.fontSize = 50;
      })

    Button('变中')
      .onClick(() => {
        this.fontSize = 35;
      })

    Button('变小')
      .onClick(() => {
        this.fontSize = 20;
      })

    Button('连续变化')
      .onClick(() => {
        const timer = setInterval(() => {
          this.fontSize--;
          if (this.fontSize === 20) {
            clearInterval(timer);
          }
        }, 30);
        //30*30=900
      })
  }
}