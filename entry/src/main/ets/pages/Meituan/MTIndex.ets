import MTFooter from './components/MTFooter';
import MTHeader from './components/MTHeader';
import MTMain from './components/MTMain';

@Entry
@Component
struct MTIndex {


  build() {

    //Stack默认居中对齐
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        MTHeader()
        MTMain()
          .layoutWeight(1)
      }
      .height('100%')
      .width('100%')
      MTFooter()
    }
    .height('100%')
    .width('100%')
  }
}