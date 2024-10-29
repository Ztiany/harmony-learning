import NamedDivider from '../../../widget/NamedDivider'

@Entry
/*
 * 为了在自定义组件中使用 V2 版本状态变量装饰器的能力，
 * 开发者可以使用 @ComponentV2 装饰器装饰自定义组件。
 *
 *  - 在 @ComponentV2 装饰的自定义组件中，开发者仅可以
 *    使用全新的状态变量装饰器，包括 @Local、@Param、
 *    @Once、@Event、@Provider、@Consumer等。
 *  - @ComponentV2 装饰的自定义组件暂不支持组件复用、
 *    LocalStorage 等现有自定义组件的能力。
 *  - 无法同时使用 @ComponentV2 与 @Component装饰同
 *    一个 struct 结构。
 *  - @ComponentV2 支持一个可选的 boolean 类型参数
 *    freezeWhenInactive ，来实现组件冻结功能。
 */
@ComponentV2
struct StateManagementV2Page {
  /**
   * 多级属性更新同步。
   */
  father: Father = new Father(
    "Alien", 44, new Son("Ztianw", 18)
  )

  build() {
    Scroll() {
      Column() {
        NamedDivider({ name: "@ObservedV2 & @Trace" })
        this.fatherInformation()
      }
      .width('100%')
    }
    .align(Alignment.Top)
    .scrollable(ScrollDirection.Vertical)
    .height('100%')
    .width('100%')
  }

  @Builder
  private fatherInformation() {
    Column() {
      Text(`father: ${this.father}`)
      Text(`son: ${this.father.son}`)
      Button("father grow")
        .type(ButtonType.Normal)
        .onClick(() => this.father.grow())
      // 使用 @ObservedV2，更新嵌套的对象的属性，可以触发 UI 更新。
      Button("father ask son to grow")
        .type(ButtonType.Normal)
        .onClick(() => this.father.son.grow())
    }
  }
}


@ObservedV2
class Son {
  @Trace private name: string
  @Trace private age: number

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

/**
 * @ObservedV2 装饰器与 @Trace 装饰器用于装饰类以及类中的属性，使得被装饰的类和属性具有深度观测的能力：
 */
@ObservedV2
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