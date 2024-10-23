// self是要共享的数据
const   self: Record<string, ResourceStr> = {
  'age': '18',
  'nickName': '一介码农',
  'gender': '男',
  'avtar': $r('app.media.b')
}
// localUserInfo是共享的数据
export const localUserInfo = new LocalStorage(self)