@Entry
@Component
struct VideoCase {
  /**
   * arkUI提供了Video组件可以直接播放视频，并提供自带的播放-暂停 全屏，拖动进度等功能
   * 用法
   * ● Video提供构造参数  Video({ src: string | Resource })
   * ● src支持在线路径-和本地资源路径
   * 本地视频我们需要放置在资源目录的原始文件中rawfile目录下，使用$rawfile函数来获取路径进行赋值即可
   */
  @State message: string = 'Hello World';

  build() {
    Tabs() {
      TabContent() {
        //   在线视频
        Video({
          src: 'https://video19.ifeng.com/video09/2024/05/23/p7199260608686989961-0-122707.mp4'
        })
      }
      .tabBar('在线视频')

      TabContent() {
        //   本地视频
        Video({
          src: $rawfile('1.mp4')
        })
      }.tabBar('本地视频')
    }
    .height('100%')
    .width('100%')
  }
}