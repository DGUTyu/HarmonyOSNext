@Entry
@Component
struct PxVpFpLpxCase {
  @State message: string = 'Hello World';
  /**
   * 样式-单位px/vp/fp/lpx
   * 使用虚拟像素，使元素在不同密度的设备上具有一致的视觉体量。
   * 1.相关概念
   * px,屏幕物理像素单位。
   * vp,屏幕密度相关像素，根据屏幕像素密度转换为屏幕物理像素，当数值不带单位时，默认单位 vp；在实际宽度为1440物理像素的屏幕上，1vp 约等于 3px（物理像素）
   * fp,字体像素单位,字体像素(font pixel) 大小默认情况下与 vp 相同，即默认情况下 1 fp = 1vp。如果用户在设置中选择了更大的字体，字体的实际显示大小就会在 vp 的基础上乘以用户设置的缩放系数，即 1 fp = 1 vp * 缩放系数。
   * lpx,视窗逻辑像素单位，lpx单位为实际屏幕宽度与逻辑宽度（通过designWidth配置)的比值，designWidth默认值为720。当designWidth为720时，在实际宽度为1440物理像素的屏幕上，1lpx为2px大小。
   *  系统还提供了对应的像素转化方法
   *  vp2px(value number):number
   *  px2vp(value number):number
   *  fp2px(value number):number
   *  px2fp(value number):number
   *  lpx2px(value number):number
   *  px2lpx(value number):number
   * 2.在不同屏幕物理分辨率下，要想实现等比例适配， 可以吗？
   * 设置lpx基准值 - resources/base/profile/main-pages.json
   * 添加window属性，设置designWidth，不设置也可以使用lpx,默认720
   */

  build() {
    Column() {
      Row() {

      }
      //一般手机是360 vp
      .width(100)
      .height(100)
      .backgroundColor(Color.Pink)

      Row() {

      }
      //一般 1vp 约等于 3px
      .width('300px')
      .height('100px')
      .backgroundColor('green')

      Row() {
        Text('100fp')
          // 专门支配文字大小，不影响其他布局的。一般来说，100f等价于100vp
          // 使用模拟器进行预览，缩放字体大小不会影响其他容器大小。
          // 使用模拟器也需要修改EntryAbility中loadContent的内容。快捷方法是先输入/，然后选择对应的页面，最后把一开始的/删掉。路径不对，加载出来的就是白的页面。
          // 在模拟器的设置里，设置显示大小和文字，
          .fontSize('100fp')
      }

      // lpx:适配一端时的方案
      // 需要设置基准值：默认720
      Row(){
        Text('100lpx')
          .fontColor('rgb(255,255,255)')
      }
      .width('360lpx')
      .height(100)
      .backgroundColor('#000')

    }
    .width('100%')
    .height('100%')

  }
}