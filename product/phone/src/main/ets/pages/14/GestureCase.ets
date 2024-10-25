import { display, promptAction } from '@kit.ArkUI'

@Entry
@Component
struct GestureCase {
  /**
   * 手势类型
   * TapGesture：点击手势，支持单次点击、多次点击识别。
   * LongPressGesture：长按手势。
   * PanGesture：平移手势，滑动最小距离为5vp时识别成功。
   * PinchGesture：捏合手势。
   * RotationGesture：旋转手势。
   * SwipeGesture：滑动手势，滑动最小速度为100vp/s时识别成功。
   * GestureGroup：手势识别组，多种手势组合为复合手势，支持连续识别、并行识别和互斥识别。
   *
   * 我们这里学习两个，长按手势LongPressGesture和平移手势PanGesture
   * 语法 .gesture( LongPressGesture().onAction(() => {})  )
   */
  @State
  screenWidth: number = 0
  @State
  showBuilder: boolean = false
  @State
  gestureType: GestureType = GestureType.NONE

  @Builder
  CustomBuilder() {
    Column() {
      Row() {
        Text('删')
          .width(80)
          .aspectRatio(1)
          .backgroundColor(this.gestureType === GestureType.DELETE_TYPE ? Color.Red : '#ccc')
          .fontColor('#fff')
          .borderRadius(40)
          .textAlign(TextAlign.Center)
          .rotate({
            //逆时针旋转 负数
            angle: -10
          })
        Text('文')
          .width(80)
          .aspectRatio(1)
          .backgroundColor(this.gestureType === GestureType.TEXT_TYPE ? Color.Red : '#ccc')
          .fontColor('#fff')
          .borderRadius(40)
          .textAlign(TextAlign.Center)
          .rotate({
            //顺时针旋转 正数
            angle: 10
          })
      }
      .width('100%')
      .padding(30)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('rgba(0,0,0,0.5)')
    .justifyContent(FlexAlign.Center)
  }

  // @State
  // gestureType: GestureType = GestureType.NONE

  aboutToAppear(): void {
    //display.getDefaultDisplaySync().width 拿到的是px，需要转换
    this.screenWidth = px2vp(display.getDefaultDisplaySync().width)
  }

  build() {
    Column() {
      Button('语音')
        .width('100%')
        .type(ButtonType.Normal)
        .height(50)//需求
          // 1.长按弹出弹层
          // 2.弹层上左滑-高亮删除 滑动finish 判断左右（屏幕宽度的一半 > 手指x坐标）
          // 3.弹层上右滑-高亮文字
          // 单个事件的绑定
          // 组合手势 gesture+GestureGroup(mode,...gesture)
        .gesture(
          //长按和左滑右滑是一组手势
          GestureGroup(
            // GestureMode枚举说明:
            // Sequence 顺序识别，按照手势的注册顺序识别手势，直到所有手势识别成功。若有一个手势识别失败，后续手势识别均失败。顺序识别手势组仅有最后一个手势可以响应onActionEnd。
            // Parallel 并发识别，注册的手势同时识别，直到所有手势识别结束，手势识别互相不影响。
            // Exclusive 	互斥识别，注册的手势同时识别，若有一个手势识别成功，则结束手势识别。
            // 小结：顺序识别Sequence(游戏出招表) 并发识别Parallel(组合手势常用) 互斥识别Exclusive(解决手势冲突)
            GestureMode.Parallel,
            //   所有的手势
            LongPressGesture()
              .onAction(() => {
                //   开始按压
                this.showBuilder = true
              })
              .onActionEnd(() => {
                //   按压结束
                this.showBuilder = false
              }),
            // 拖动手势
            PanGesture()
              .onActionStart((event) => {
                // event是事件对象
                console.log('PanGesture', 'onActionStart')
              })
              .onActionUpdate((event) => {
                // event是事件对象，这里拿到手指的坐标
                console.log('PanGesture', 'onActionUpdate')
                //取出第0个手指在全局上的坐标x
                if (this.showBuilder) {
                  if (event.fingerList[0].globalX < this.screenWidth / 2) {
                    promptAction.showToast({
                      message: '我在左边'
                    })
                    this.gestureType = GestureType.DELETE_TYPE
                  } else {
                    promptAction.showToast({
                      message: '我在右边'
                    })
                    this.gestureType = GestureType.TEXT_TYPE
                  }
                }
              })
              .onActionEnd(() => {
                // 回归初始状态
                this.gestureType = GestureType.NONE
                console.log('PanGesture', 'onActionEnd')
              })
          )
        )
    }
    .height('100%')
    .width('100%')
    .padding(12)
    //按钮靠下居中
    .justifyContent(FlexAlign.End)
    //全屏弹层 和bindSheet()用法类似 默认是抽屉效果
    .bindContentCover(this.showBuilder, this.CustomBuilder(), {
      modalTransition: ModalTransition.NONE
    })
  }
}

enum GestureType {
  DELETE_TYPE,
  TEXT_TYPE,
  NONE
}