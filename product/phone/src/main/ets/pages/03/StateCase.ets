import { promptAction } from '@kit.ArkUI'

@Entry
@Component
  /**
   * 基础-组件状态
   * 当我们需要在组件中记录一些状态时，变量应该显示的在struct中声明，并注明类型
   */

  // 1.数据类型
  // 1.1基本数据类型
  // 1.1.1 字符串类型:string
  // 字面量：  '内容'   "内容"    `内容`
  // 如果真的需要显示引号，可以外单内双或外双内单。反引号可以写表达式，也叫模板字符串。
  // 1.1.2 数字类型:number
  // 字面量：  0   0.1  -0.1
  // 1.1.3 布尔类型:boolean
  // 字面量： true  false
  // 1.1.4 未定义类型:undefined
  // 字面量： undefined   初始化=声明+赋值 let a:类型 = '123'  赋值 a = '456'
  // 1.1.5 空类型:null
  // 字面量： null   let b = null  初始化不知道给什么值的时候会用
  // 1.2引用数据类型
  // 1.2.1 数组类型 string[]   Array<number>
  // 字面量： [1,2,3]   ['1','2']  ['1',2]  [true ,1 ,'2'] [170,171,172]
  // 可以放任何数据类型，相当于一个集合
  // 1.2.2 对象类型
  // interface IObjectType {
  //     height:number
  //     name:string
  // }
  // 字面量:
  // {
  //   // key（属性名） : val（属性值）
  //   height:170,
  //   weight:171,
  //   blood:172
  // }
  // eg:
  // { space:20,warp:FlexWrap.Wrap}
  // 1.2.3 函数类型
  // 字面量：
  // a是对参数类型的约束   number是对返回值类型的约束
  // (a:string)=>number
  //   const fn = ()=>{} (组件外)
  //   function fn1(){} (组件外)
  //   fn:()=>void = ()=>{} (组件内)
  //   fn(){}  (组件内)c

  // 1.如何在组件内声明一个数据
  // 变量名：数据类型 = 初始值
  // 2.如何让数据发生变化时更新UI
  // @State作用：可以让数据发生变化时UI自动更新(只有自身或者第一层发生变化)
  // @State
struct StateCase {
  build() {
    Column() {
      timer()
    }
  }
}

/**
 * 实现一个计时器
 * 1.数据需要声明后才能使用，声明时需要标注类型
 2.数据改变后需要响应式更新到页面上，需要给数据添加@State修饰符

 数据结构说明
 ● 基本数据类型
   ○ string(字符串)： '123' ，"123"， `123`
   ○ number(数字)：0 ，1.23
   ○ boolean(布尔值)：true ，false
   ○ null(空)：null
   ○ undefined(未定义):undefined
 ● 引用数据类型：
   ○ 接口：
     ■ 定义接口
       interface Person {
         name:string
         age:number
       }

     ■ 使用接口作为某种对象的类型限制
       let obj :Person = {
         name:'zs',
         age:18
       }
   ○ 类:
     ■ 定义无构造函数类
       class PersonModel1 {
         name:string = 'unknow'
         age:number = 0
       }
     ■ 使用类作为某种对象的类型限制
       let obj1 :PersonModel1 = new PersonModel1( )
     ■ 定义有构造函数类
       class PersonModel2 {
         name:string = 'unknow'
         age:number = 0
         constructor(model:Person){
           this.name = model.name
           this.age = model.age
         }
       }
     ■ 使用类作为某种对象的限制
        let obj2:PersonModel2 = new PersonModel2( obj )
 */
@Component
struct timer {
  @State
  num: number = 0

  build() {
    Column(){
      Row({ space: 20 }) {
        Button('-')
          //默认圆形
          .type(ButtonType.Circle)
          .onClick(() => {
            this.num--
          })

        Text(this.num.toString())

        Button('+')
          //矩形
          //.type(ButtonType.Normal)
          .onClick(() => {
            this.num++
            promptAction.showToast({
              message:JSON.stringify(this)
            })
          })
      }
      .height('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      //JSON.stringify把一个对象转成字符串的形式
      //打印出来的 是 "_num":{"subscribers_":
      //鸿蒙中，如果打印出来的信息中有下划线的变量都是它自动帮你处理了。加上了@State，它会帮你包裹一层，后续你用到的是包裹后的变量
      Text(JSON.stringify(this))
    }
  }
}