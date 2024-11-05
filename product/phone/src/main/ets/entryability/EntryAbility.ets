import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CustomColors, KeyboardAvoidMode, ThemeControl, window } from '@kit.ArkUI';
import { PreferencesClass } from '../pages/09/PreferencesClass';

/**
 * Ability有15个生命周期函数
 * https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-app-ability-uiability-V5#
 * UIAbility的生命周期包括Create、Foreground、Background、Destroy四个状态
 *
 * UIAbility相当于我们应用中的一个任务，我们可以把自己的app想象成一个UIAbility，但是当项目越来越大，需要扩展和分担业务的时候，可以采取多个
 * 多个的Ability必须建立在hap中。hsp和har均不让建Ability
 */
export default class EntryAbility extends UIAbility {
  // async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
  //1.先进行Ability创建
  //每一个Ability都会绑定一个stage
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    // manager管理器
    // const manager = abilityAccessCtrl.createAtManager()
    // await等待操作的时候进行使用（华为应用商店并不推荐这样申请权限）
    // await manager.requestPermissionsFromUser(this.context, [
    //   "ohos.permission.APPROXIMATELY_LOCATION"
    // ])
  }

  //再销毁Ability
  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  //2.创建stage
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    // 通过这种方式最简单，但是相当于给所有的页面都设置了沉浸式，
    // 如果某些页面不需要设置沉浸式，还需要在页面中通过获取window来关闭
   // windowStage.getMainWindow().then(window =>{
   //   window.setWindowLayoutFullScreen(true)
   // })

    //推荐做法
    const localData: Record<string, string> = {
      // 'messageKey2': '雷军',
      'messageKey': '雷军',
      'name': '雷神'
    }

    // 坑点：在Ability进行持久化不生效！！！
    // PersistentStorage.persistProp('token',1)
    // preferences来区分到底加载哪个页面！

    const token = PreferencesClass.getToken(this.context, PreferencesClass.defaultStore, PreferencesClass.tokenKey)
    let pageUrl = ''
    if (token === '') {
      //   没登录过
      pageUrl = 'pages/09/PreferenceCase'
    } else {
      //   登录过
      pageUrl = 'pages/09/PreferenceResultCase'
    }

    //主题设置
    //1.实现主题类型
    class ForgiveTheme implements CustomTheme {
      //主题并不是全部得设置，所以先变成可选的
      colors?: CustomColors

      constructor(colors: CustomColors) {
        this.colors = colors
      }
    }

    //2.定制一个主题的实例
    const forgiveTheme = new ForgiveTheme({
      fontPrimary: '#ff00ff0f'
    })
    //3.设置主题
    //ThemeControl.setDefaultTheme(forgiveTheme)


    //localStorageEntry作为页面启动的第二个参数
    const localStorageEntry = new LocalStorage(localData)
    //加载页面
    windowStage.loadContent('pages/14/DownloadCase', localStorageEntry, (err) => {
      //loadContent中设置键盘的避让模式
      //压缩模式
      windowStage.getMainWindowSync().getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE)
      //偏移模式（默认），当键盘高度改变时，偏移整个页面
      //windowStage.getMainWindowSync().getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET)

      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  //先销毁stage
  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  //应用恢复前台时触发
  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  //应用后台时触发
  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  /**
   * UIAbility生命周期回调，当UIAbility侧滑返回时触发，根据返回值决定是否销毁UIAbility。
   * 当targetSdkVersion<12时，默认返回值为false，会销毁UIAbility。主要看是否一开始有图标icon
   * 当targetSdkVersion>=12时，默认返回值为true，会将UIAbility移动到后台不销毁。
   * @returns 是否保留ability
   */
  onBackPressed(): boolean {
    // return true
    return false
  }
}
