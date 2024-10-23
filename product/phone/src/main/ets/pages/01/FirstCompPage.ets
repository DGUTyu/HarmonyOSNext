import FirstFooterCase from './FirstFooterCase'
import FirstHeaderCase from './FirstHeaderCase'
import FirstMainCase from './FirstMainCase'

@Entry
@Component
struct FirstCompPage {
  build() {
    Column() {
      FirstHeaderCase()
      FirstMainCase()
      FirstFooterCase()
    }
  }
}