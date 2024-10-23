import { geoLocationManager } from '@kit.LocationKit';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct PermissionCase {
  @State
  result: geoLocationManager.Location = {} as geoLocationManager.Location

  build() {
    Column({ space: 20 }) {
      // 1.系统权限：网络权限
      Image('https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png')
        .width(100)
      // 2.用户权限：地理位置。手机模拟器要开定位
      Button('获取当前经纬度')
        //箭头函数加上async
        .onClick(async () => {
          // async await : 处理  Promise<?>返回值
          this.result = await geoLocationManager.getCurrentLocation()
          promptAction.showToast({
            message: JSON.stringify(this.result)
          })
        })
      Text(this.result.latitude + '')
      Text(this.result.longitude + '')

    }
    .height('100%')
    .width('100%')
  }
}