@Builder
function MyContactsBuilder() {
  ContactsPage()
}

@Component
struct ContactsPage {
  build() {
    //必须放置NavDestination才能显示
    NavDestination() {
      Column() {
        Text('联系人内容')
        Image($r('app.media.b'))
        Image($r('app.media.b'))
        Image($r('app.media.b'))
      }
    }
  }
}

export default ContactsPage