@Entry
@Component
struct VideoControlCase {
  /**
   * 视频控制-播放-暂停--倍速-全屏-进度
   * 我们可以通过构造函数传入currentProgressRate 控制倍速，它来自PlaybackSpeed的枚举，目前支持
   * 0.75-1-1.25-1.75-2倍速设置
   *
   * 同理- 如果我们想播放一段音频-用同样的方式给到我们的Video的src属性就可以了Video同时支持
   */
  @State
  speed: number = 1
  @State
  playSpeed: number = 1
  @State
  isMuted: boolean = false
  @State
  showController: boolean = false
  @State
  currentTime: number = 0
  @State
  videoTime: number = 0
  controller: VideoController = new VideoController()

  build() {
    Row() {
      Tabs() {
        TabContent() {
          Column({ space: 20 }) {
            Video({
              currentProgressRate: this.speed,
              src: 'https://video19.ifeng.com/video09/2024/05/23/p7199260608686989961-0-122707.mp4'
            })
              .width('100%')//长宽比，视频会被裁剪
              .aspectRatio(2)
            Slider({
              //也可以统一用PlaybackSpeed.Speed_Forward_2_00_X
              value: this.speed,
              min: 0.75,
              step: 0.25,
              max: 2.00,
              style: SliderStyle.InSet
            })
              .showSteps(true)
              .onChange(value => {
                this.speed = value
              })

            Text(this.speed + "倍速").fontSize(14).textAlign(TextAlign.Center).width('100%')

          }
          .width('100%')
        }.tabBar("在线视频")

        TabContent() {
          Column() {
            Stack({ alignContent: Alignment.BottomEnd }) {
              Video({
                src: $rawfile('1.mp4'),
                // 控制器
                controller: this.controller,
                // 封面图
                previewUri: $r('app.media.b'),
                currentProgressRate: this.playSpeed,
              })
                .height(350)// 填充模式
                  //Contain 最长的边占100，其余填黑
                  //Cover 最短的边占100，其余裁剪
                .objectFit(ImageFit.Contain)
                .autoPlay(true)//自动播放
                .muted(this.isMuted)//静音播放
                .loop(true)//是否循环播放
                .controls(this.showController)//是否展示控制条
                .onPrepared((time) => {
                  // 视频准备好了可以获取视频的时长
                  this.videoTime = time.duration
                })
                .onUpdate((time) => { // 视频播放中可以获取播放的时长
                  this.currentTime = time.time
                })
                .onFullscreenChange((screen) => { // 根据是否全屏判断是否展示控制条
                  this.showController = screen.fullscreen
                })

              //如果希望放大还有额外的功能，需要自已实现全屏（沉浸式+堆叠+100%宽高）
              Column({ space: 20 }) {
                Text('点赞').fontColor(Color.White)
                Text('评论').fontColor(Color.White)
                Text('转发').fontColor(Color.White)
              }
            }

            Row() {
              Button('播放')
                .onClick(() => {
                  this.controller.start()
                })
              Button('暂停')
                .onClick(() => {
                  this.controller.pause()
                })
              Button('停止')
                .onClick(() => {
                  this.controller.stop()
                })
              Button('静音')
                .onClick(() => {
                  this.isMuted = !this.isMuted
                })
            }
            .width('100%')

            Row() {
              Button('全屏')
                .onClick(() => {
                  this.controller.requestFullscreen(true)
                  // setTimeout(() => {
                  //   this.controller.exitFullscreen()
                  // }, 3000)
                })
              // 一般不需要手动全屏，可以过几秒自动退出，提示该充值了！
              Button('退出全屏')
                .onClick(() => {
                  this.controller.exitFullscreen()
                })
            }
            .width('100%')

            Row({ space: 20 }) {
              Text('播放进度：')
              Slider({
                //value: $$this.currentTime, // $$加没什么用
                value: this.currentTime,
                min: 0,
                max: this.videoTime,
              })
                .layoutWeight(1)
                .onChange((val) => { // 改变时设置视频播放时长
                  //this.controller.setCurrentTime(val)
                  this.controller.setCurrentTime(val, SeekMode.Accurate)
                })
            }
            .padding(20)

            Row({ space: 20 }) {
              Text('播放速度：')
              Slider({
                value: $$this.playSpeed,
                min: 0.75,
                step: 0.25,
                max: 2.00,
                style: SliderStyle.InSet
              })
                .layoutWeight(1)
            }
            .padding(20)

          }
        }
        .tabBar("本地视频")
      }
      .animationDuration(300)
    }
    .height('100%')
    .width('100%')
  }
}

//弹幕：avplayer才能接入弹幕