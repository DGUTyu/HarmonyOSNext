import ZhComment from './components/ZhComment'
import ZhHeader from './components/ZhHeader'

@Entry
@Component
struct ZhiHu {
  // 评论回复的数据（对象数组）数据后续都会从接口获取到
  // 更新commentList是父组件的List产生了更新，重新渲染子组件
  // 投机取巧的办法：利用父组件传递引用数据类型的特性实现！！！
  @State
  commentList: ReplyItemModel[] = [
    new ReplyItemModel({
      id: 1,
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: '偏执狂-妄想家',
      content: '更何况还分到一个摩洛哥[惊喜]',
      time: '11-30',
      area: '海南',
      likeNum: 34,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 2,
      avatar: 'https://pic1.zhimg.com/v2-5a3f5190369ae59c12bee33abfe0c5cc_xl.jpg?source=32738c0c',
      author: 'William',
      content: '当年希腊可是把1：0发挥到极致了',
      time: '11-29',
      area: '北京',
      likeNum: 58,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 3,
      avatar: 'https://picx.zhimg.com/v2-e6f4605c16e4378572a96dad7eaaf2b0_l.jpg?source=06d4cd63',
      author: 'Andy Garcia',
      content: '欧洲杯其实16队球队打正赛已经差不多，24队打正赛意味着正赛阶段在小组赛一样有弱队。',
      time: '11-28',
      area: '上海',
      likeNum: 10,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 4,
      avatar: 'https://picx.zhimg.com/v2-53e7cf84228e26f419d924c2bf8d5d70_l.jpg?source=06d4cd63',
      author: '正宗好鱼头',
      content: '确实眼红啊，亚洲就没这种球队，让中国队刷',
      time: '11-27',
      area: '香港',
      likeNum: 139,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 5,
      avatar: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
      author: '柱子哥',
      content: '我是支持扩大的，亚洲杯欧洲杯扩到32队，世界杯扩到64队才是好的，世界上有超过200支队伍，欧洲区55支队伍，亚洲区47支队伍，即使如此也就六成出现率',
      time: '11-27',
      area: '旧金山',
      likeNum: 29,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 6,
      avatar: 'https://picx.zhimg.com/v2-fab3da929232ae911e92bf8137d11f3a_l.jpg?source=06d4cd63',
      author: '飞轩逸',
      content: '禁止欧洲杯扩军之前，应该先禁止世界杯扩军，或者至少把亚洲名额一半给欧洲。',
      time: '11-26',
      area: '里约',
      likeNum: 100,
      likeFlag: false
    })
  ]
  // 评论的数据（单个对象）
  // 更新commentContent子组件数组发生变化，自己更新的UI
  @State
  commentContent: ReplyItemModel = new ReplyItemModel({
    // 生成唯一标识的工具，需要导入util
    // id:Number(util.generateRandomUUID()),
    id: 999,
    avatar: 'https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png!avatar30',
    author: 'Jack',
    content: 'Jack帅不帅？？？',
    time: '06-26',
    area: '西安',
    likeNum: 999999,
    likeFlag: false
  })

  // 父组件->子组件传值：
  // 1.简单数据类型(值类型传递)  -》 重新创建一个值(和父组件没有关联)
  // 2.引用数据类型传递(引用地址) -》 父子组件使用的是同一个对象

  build() {
    Column() {
      //1.头部
      ZhHeader()
      //2.评论组件
      //ZhComment()
      ZhComment({
        replyItem: this.commentContent
      })
      //3.分割线
      Divider().strokeWidth(6).backgroundColor('#ececec')
      //4.回复标题
      Row() {
        Text(`回复 ${this.commentList.length}`)
      }.width('100%')
      .padding({
        left: 20,
        top: 6,
        bottom: 6
      })

      //5.评论回复列表
      // ForEach([1, 2, 3, 4, 5], () => {
      //   ZhComment()
      // })
      List() {
        ForEach(this.commentList, (item: ReplyItem) => {
          ListItem() {
            //组件传值：父组件的数据传递给子组用
            //子组件必须得声明过这个数才能进行传递！
            ZhComment({
              replyItem: item
            })
          }
        })
      }
      .layoutWeight(1)

      //6.回复输入框
    }.width('100%')
    .height('100%')
  }
}

//1.interface 直接限制对象类型
// 导出是为了让子组件也能使用类型限制
export interface ReplyItem {
  avatar: ResourceStr
  author: string
  id: number
  content: string
  time: string
  area: string
  likeNum: number
  //不一定有点赞。推荐这种写法，而不是用 ?
  likeFlag: boolean | null
}

//2.i2c生成class 生成新对象(需要点赞，故选择使用class)
// 导出是为了让子组件也能使用这个类型限制
// 1.给需要修改的类添加Observed
@Observed
export class ReplyItemModel implements ReplyItem {
  avatar: ResourceStr = ''
  author: string = ''
  id: number = 0
  content: string = ''
  time: string = ''
  area: string = ''
  likeNum: number = 0
  likeFlag: boolean | null = null

  constructor(model: ReplyItem) {
    this.avatar = model.avatar
    this.author = model.author
    this.id = model.id
    this.content = model.content
    this.time = model.time
    this.area = model.area
    this.likeNum = model.likeNum
    this.likeFlag = model.likeFlag
  }
}

