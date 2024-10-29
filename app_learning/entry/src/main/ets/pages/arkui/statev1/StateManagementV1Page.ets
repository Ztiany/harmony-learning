import { logger } from '../../../utils/Logger'
import NamedDivider from '../../../widget/NamedDivider'

const TAG = "StateManagement"

@Entry
@Component
struct StateManagementV1Page {
  /**
   * 自用的 State 变量
   */
  @State
  private counterForSelf: number = 1
  /**
   * 单向同步的 State 变量
   */
  @State
  counterForProp: number = 1
  /**
   * 双向同步的 State 变量
   */
  @State
  counterForLink: number = 1
  /**
   * 跨组件双向同步的 Provide 变量，其他行为与 State 相同，只是支持跨组件。
   */
  @Provide("v1-counter")
  counterForProvide: number = 1
  /**
   * 多级属性更新同步。
   */
  @State
  father: Father = new Father(
    "Alien", 44, new Son("Ztianw", 18)
  )
  /**
   * 演示 $$ 的作用：
   *
   *  1. $$ 运算符为系统内置组件提供 TS 变量的引用，使得 TS 变量和系统内置组件的内部状态保持同步。
   *  2. $$ 还用于 @Builder 装饰器的按引用传递参数，开发者需要注意两种用法的区别。
   */
  @State inputText: string = ''
  private controller: TextInputController = new TextInputController()
  /**
   * 多级属性更新同步。
   */
  @State
  personForTrack: TrackedPerson = new TrackedPerson(
    "TrackedPerson", 44
  )

  build() {
    Scroll() {
      Column() {
        NamedDivider({ name: "@State" })
        this.counter()


        NamedDivider({ name: "@State & @Prop" })
        this.counterProp()
        ChildPropCounter({
          counter: this.counterForProp
        })


        NamedDivider({ name: "@State & @Link" })
        this.counterLink()
        ChildLinkCounter({
          counter: this.counterForLink
        })


        NamedDivider({ name: "@Provide & @Consume" })
        this.counterProvide()
        ChildConsumeCounter()


        NamedDivider({ name: "@Observed & @ObjectLink" })
        this.fatherInformation()
        SonInformation({
          // 不能通过方法传递，只能通过属性传递。
          son: this.father.son
        })


        NamedDivider({ name: "@Watch" })
        this.counterProp()
        ChildPropWatchCounter({
          counter: this.counterForProp
        })


        NamedDivider({ name: "$$" })
        this.textInput()


        NamedDivider({ name: "@Track" })
        this.trackedPersonInformation()

      }
      .width('100%')
    }
    .align(Alignment.Top)
    .scrollable(ScrollDirection.Vertical)
    .height('100%')
    .width('100%')
  }

  @Builder
  trackedPersonInformation() {
    Text("The Tracked Person:")
    //Text(`  name: ${this.personForTrack.name}`) // 不用引用非 tracked 的变量，会崩溃。
    Text(`  age: ${this.personForTrack.age}`)
    Button("change the person's name")
      .onClick(() => {
        this.personForTrack.name = "Alien-" + (Math.random() * 100)
      })
    Button("change the person's age")
      .onClick(() => {
        this.personForTrack.age = (Math.random() * 100)
      })
  }

  @Builder
  private counter() {
    Text(`counting: ${this.counterForSelf}`)
    Button("Add")
      .type(ButtonType.Normal)
      .onClick(() => this.counterForSelf++)
  }

  @Builder
  private counterProp() {
    Text(`counting: ${this.counterForProp}`)
    Button("Add")
      .type(ButtonType.Normal)
      .onClick(() => this.counterForProp++)
  }

  @Builder
  private counterLink() {
    Text(`counting: ${this.counterForLink}`)
    Button("Add")
      .type(ButtonType.Normal)
      .onClick(() => this.counterForLink++)
  }

  @Builder
  private counterProvide() {
    Text(`counting: ${this.counterForProvide}`)
    Button("Add")
      .type(ButtonType.Normal)
      .onClick(() => this.counterForProvide++)
  }

  @Builder
  private fatherInformation() {
    Column() {
      Text(`father: ${this.father}`)
      Text(`son: ${this.father.son}`)
      Button("father grow")
        .type(ButtonType.Normal)
        .onClick(() => this.father.grow())
      // 更新嵌套的对象的属性，无法触发 UI 更新。
      Button("father ask son to grow")
        .type(ButtonType.Normal)
        .onClick(() => this.father.son.grow())
    }
  }

  @Builder
  private textInput() {
    Column({ space: 20 }) {
      Text(this.inputText)
      // 这里如果不使用 $$this.inputText，那么 TextInput 的输入不会同步会 this.inputText。
      TextInput({ text: $$this.inputText, placeholder: 'input your word...', controller: this.controller })
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width(300)
        .onChange((value: string) => {
          logger.d(TAG, `textInput.onChange: ${value}}`)
          logger.d(TAG, `textInput.onChange, this.inputText: ${this.inputText}`)
        })
    }.width('100%').justifyContent(FlexAlign.Center)
  }
}

@Component
struct ChildPropCounter {
  /**
   * Prop 修饰的变量可以自己初始化，加上 Require 后，必须由父组件初始化。
   *
   * Prop 装饰变量时会进行深拷贝，在拷贝的过程中除了基本类型、Map、Set、Date、Array 外，都会丢失类型。
   */
  @Require @Prop counter: number

  build() {
    Column() {
      Text(`child counting: ${this.counter}`)
      Button("Child Add")
        .type(ButtonType.Normal)
        .onClick(() => this.counter++)
    }
  }
}

@Component
struct ChildPropWatchCounter {
  /** Prop 修饰的变量可以自己初始化，加上 Require 后，必须由父组件初始化。*/
  @Require @Prop @Watch("onCounterChanged") counter: number

  build() {
    Column() {
      Text(`child counting: ${this.counter}`)
      Button("Child Add")
        .type(ButtonType.Normal)
        .onClick(() => this.counter++)
    }
  }

  onCounterChanged(changedPropertyName: string) {
    logger.d(TAG, `onCounterChanged is called: ${changedPropertyName}`)
  }
}

@Component
struct ChildLinkCounter {
  /** Link 修饰的变量必须被父组件初始化。*/
  @Link counter: number

  build() {
    Column() {
      Text(`child counting: ${this.counter}`)
      Button("Child Add")
        .type(ButtonType.Normal)
        .onClick(() => this.counter++)
    }
  }
}

@Component
struct ChildConsumeCounter {
  /** Consume 修饰的变量必须能在组件树中有对应的同名 Provide，否则就会崩溃。*/
  @Consume("v1-counter")
  counter: number

  build() {
    Column() {
      Text(`child counting: ${this.counter}`)
      Button("Child Add")
        .type(ButtonType.Normal)
        .onClick(() => this.counter++)
    }
  }
}

@Observed
class Son {
  private name: string
  private age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }

  grow() {
    this.age++
  }

  getName(): string {
    return this.name
  }

  getAge(): number {
    return this.age
  }

  toString(): string {
    return `I am ${this.name} and ${this.age} years old.`
  }
}

@Observed
class Father {
  private name: string
  private age: number
  son: Son

  constructor(name: string, age: number, son: Son) {
    this.name = name
    this.age = age
    this.son = son
  }

  grow() {
    this.age++
    this.son.grow()
  }

  toString(): string {
    return `I am ${this.name} and ${this.age} year old. My son is ${this.son.getName()} and he is ${this.son.getAge()} years old.`
  }
}

@Component
struct SonInformation {
  /** ObjectLink 只能由父组件初始化。*/
  @ObjectLink son: Son

  build() {
    Column() {
      Text(`son: ${this.son}`)
      Button("son grow")
        .type(ButtonType.Normal)// 父组件感知不到 son 在子组件中的更新。
        .onClick(() => this.son.grow())
    }
  }
}

class TrackedPerson {
  name: string
  @Track age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}