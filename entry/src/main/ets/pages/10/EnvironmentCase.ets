import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct EnvironmentCase {
  // 补充知识：面试提升
  // 实际应用缺陷：查询可用，不可写入
  // 设备状态：无法在应用中修改的！

  /**
   * 开发者如果需要应用程序运行的设备的环境参数，以此来作出不同的场景判断，
   * 比如多语言，暗黑模式等，需要用到Environment设备环境查询。
   * Environment内置参数有
   * accessibilityEnabled 获取无障碍屏幕读取是否启用。
   * colorMode 色彩模型
   * fontScale 字体大小比例
   * fontWeightScale 字体粗细程度
   * layoutDirection 布局方向类型
   * languageCode 当前系统语言
   */
  @State
  colorMode: ColorMode = ColorMode.LIGHT //0

  onPageShow(): void {
    // 设备环境变量查询：查到结果并设置给AppStorage
    Environment.envProp('colorMode', ColorMode.LIGHT)

    // 从AppStorage取出来看看！！
    this.colorMode = AppStorage.get('colorMode') as ColorMode

    // 没有用，设备环境变量不支持应用修改
    this.colorMode = ColorMode.DARK //1
    promptAction.showToast({
      message: '深色模式：' + this.colorMode
    })
  }

  build() {
    RelativeContainer() {

    }
    .height('100%')
    .width('100%')
  }
}