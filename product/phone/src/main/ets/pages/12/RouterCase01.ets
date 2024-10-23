import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct RouterCase01 {
  /**
   * router的使用都是基于Entry修饰的组件
   * 都是基于resources/base/profile/main-page.json中的路由配置来跳转的
   *
   * router提供下列的几个方法
   * ● pushUrl -压栈
   * ● replaceUrl-替换页面栈
   * ● clear-清空之前页面栈
   * ● back-返回
   * ● getLength-获取当前所有的路由长度
   * ● getParams-获取参数
   * ● getState-获取当前路由状态
   * ● 单例模式
   * ● showAlertBeforeBackPage- （返回阻断）
   *
   * pushUrl
   * pushUrl会在当前页面层级再加一层页面，不管是不是同一个页面，
   * A -> B   相当于当前页面栈中存在两个页面 A和B
   * 鸿蒙系统最多页面栈为32，到达32时无法继续push，可以replace(模拟器bug:push到32时replace会显示33，真机不会出现这个问题)
   * Navigation跳多少都可以
   */


  @State message: string = '去Router02';

  aboutToAppear(): void {
    promptAction.showToast({
      //获取页面栈信息
      message: router.getLength()
    })


    // 阻止系统返回进行提示(最后的倔强，只能起到提示作用，做不了回调监听)
    router.showAlertBeforeBackPage({
      message: '狠心离开吗？'
    })
  }

  build() {
    Column() {


      Text(this.message)
        .fontSize(30)
        .onClick(() => {
          let myParams: Record<string, string> = {
            'price': '9999'
          }

          router.pushUrl({
            //注意跳转的页面必须是Entry修饰的页面
            //压栈跳转，最多32个记录
            url: 'pages/12/RouterCase02',
            params: myParams
          })

          //replaceUrl会替换当前页面，不管是不是同一个页面，替换之后相当于页面重新执行
          // router.replaceUrl({
          //   url: 'pages/12/RouterCase02'
          // })

          //清空页面栈中的所有历史页面，仅保留当前页面作为栈顶页面。
          //router.clear()

          //回到上一个页面- 回到上一个页面，上一个页面并不会重新初始化
          //router.back()
        })

      Button('单例模式跳转')// 如果栈里已经有了这个路由记录，就会提升到最前面，不会进行新的创建
        .onClick(() => {
          router.pushUrl({
            url: 'pages/12/RouterCase02'
          }, router.RouterMode.Single)
        })
    }
    .height('100%')
    .width('100%')
  }
}