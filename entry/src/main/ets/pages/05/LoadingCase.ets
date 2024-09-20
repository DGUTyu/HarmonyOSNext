import HMLoading from './HMLoading';

@Entry
@Component
struct LoadingCase {
  @State
  showLoading: boolean = false
  timeoutId: number = -1

  // 效果：一进页面就展示,过3秒关闭
  aboutToAppear(): void {
    this.showLoading = true
    this.timeoutId = setTimeout(() => {
      this.showLoading = false
    }, 3000)

    //   关闭延迟执行函数
    // clearTimeout(this.timeoutId)

  }

  build() {
    Column() {
      if (this.showLoading) {
        HMLoading()
      }
    }
    .height('100%')
    .width('100%')
  }
}