@Preview
@Component
struct HMLoading {
  // 效果：进行loading转动
  @State
  value: number = 0
  // 存储简写执行函数标识，这个标识是唯一的，初始值随便给，最好给-1
  // 存储setInterval的返回值
  timer: number = -1

  // 四.组件挂载时执行
  aboutToAppear(): void {
    // build函数执行前
    // 让value递增
    // 间歇执行函数-每隔一段时间执行一次
    // 二.间歇执行函数（开启和关闭）
    this.timer = setInterval(() => {
      if (this.value === 100) {
        this.value = 0
      }
      this.value++
    }, 10)
    //   10是毫秒
    //   延迟执行函数-过一段时间执行一次

    // 三.延迟执行函数（开启和关闭）
    // setTimeout(() => {
    //   //   3秒之后关闭操作
    //   clearInterval(this.timer)
    // }, 3000)
  }

  // 五.组件销毁时执行
  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    //加载效果,新建 ArkTS File
    // 默认直线形状
    Progress({
      total: 100,
      value: this.value,
      type: ProgressType.Ring
    })
  }
}

//导出组件
export default HMLoading