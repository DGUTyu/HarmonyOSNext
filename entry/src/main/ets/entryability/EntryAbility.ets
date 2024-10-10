import { abilityAccessCtrl, AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { PreferencesClass } from '../pages/09/PreferencesClass';

export default class EntryAbility extends UIAbility {
  // async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    // manager管理器
    // const manager = abilityAccessCtrl.createAtManager()
    // await等待操作的时候进行使用（华为应用商店并不推荐这样申请权限）
    // await manager.requestPermissionsFromUser(this.context, [
    //   "ohos.permission.APPROXIMATELY_LOCATION"
    // ])
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

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

    //localStorageEntry作为页面启动的第二个参数
    const localStorageEntry = new LocalStorage(localData)
    windowStage.loadContent('pages/11/SafeAreaCase', localStorageEntry, (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
