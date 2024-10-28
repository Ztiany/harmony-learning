/**
 * 演示使用 Builder  装饰器自定义组件及其相关用法：
 *
 *  - 值传递与引用传递
 *  - LocalBuilder 装饰器
 *  - BuilderParam
 *  - wrapBuilder
 *  - Styles 装饰器
 *  - Extend 装饰器
 *  - stateStyles
 *  - AnimatableExtend 装饰器
 *  - Require 装饰器
 */
@Entry
@Component
struct BuilderPage {
  @State textWidth: number = 100;
  @State counter: number = 1;
  @State label: string = "Alien";

  /**
   * Builder 无法保证 this 始终指向当前的 BuilderPage。
   */
  @Builder
  componentBuilder() {
    Text(`${this.label}`)
  }

  /**
   * LocalBuilder 保证 this 始终指向当前的 BuilderPage。
   */
  @LocalBuilder
  localComponentBuilder() {
    Text(`${this.label}`)
  }

  build() {
    Scroll() {
      Column() {

        Divider().height(10)
        overBuilderByReference1({
          param: this.counter
        })
        overBuilderByReference$$({
          param: this.counter
        })
        overBuilderByValue(this.counter)
        Button("Add")
          .onClick(() => {
            this.counter++
          })
          .width('50%')


        Divider().height(10)
        Child({ customBuilderParam: this.componentBuilder })
        Child({
          // 通过箭头函数，保持 this 的引用为当前 BuilderPage。
          customBuilderParam: (): void => {
            this.componentBuilder()
          }
        })
        Child({ customBuilderParam: this.localComponentBuilder })


        Divider().height(10)
        wrappedOverBuilderByValue.builder(10)


        Divider().height(10)
        Text("I am a Text")
          .redFrame()
        Text("I am a Text")
          .redText()


        Divider().height(10)
        Button("I am a Button").multiStatedButton()


        Divider().height(10)
        Text("AnimatableProperty")
          .animatableWidth(this.textWidth)
          .animation({ duration: 2000, curve: Curve.Ease })
        Button("Play")
          .onClick(() => {
            this.textWidth = this.textWidth == 100 ? 160 : 100;
          })


        Divider().height(10)
        StrictChild({
          label: "Parent Label"
        })

      }
      .width('100%')
    }
    .scrollable(ScrollDirection.Vertical)
    .height('100%')
    .width('100%')
  }
}

interface Reference {
  param: number
}

/**
 * 按引用传递参数时，传递的参数可为状态变量，且状态变量的改变会引起 @Builder 方法内的 UI 刷新。
 */
@Builder
function overBuilderByReference1(params: Reference) {
  Row() {
    Text(`UseStateVarByReference1: ${params.param} `)
  }
}

/**
 * 按引用传递参数时，如果在 @Builder 方法内调用自定义组件，ArkUI 提供 $$ 作为按引用传递参数的范式。
 */
@Builder
function overBuilderByReference$$($$: Reference) {
  Row() {
    Text(`UseStateVarByReference$$: ${$$.param} `)
    // 虽然传参是一个值，但是 $$ 保证其作为引用传递。
    HelloComponent({ message: $$.param })
  }
}

/**
 * 调用 @Builder 装饰的函数默认按值传递。当传递的参数为状态变量时，状态变量的改变不会引起 @Builder 方法内的 UI 刷新。所以当使用状态变量的时候，
 * 推荐使用按引用传递。
 */
@Builder
function overBuilderByValue(params: number) {
  Row() {
    Text(`UseStateVarByValue: ${params} `)
  }
}

@Component
struct HelloComponent {
  @Prop message: number;

  build() {
    Row() {
      Text(`HelloComponent: ${this.message}`)
    }
  }
}

@Component
struct Child {
  label: string = `Child`;
  @BuilderParam customBuilderParam: () => void;

  build() {
    Column() {
      this.customBuilderParam()
    }
  }
}

/**
 * 无法作为 @Builder 方法被调用。
 */
const overBuilderByValueReference = overBuilderByValue

/**
 * 当 @Builder 方法被赋值给变量或者数组后，赋值的变量或者数组在 UI 方法中无法使用。（丢失了其作为 UI 构建的身份），使用 wrapBuilder 可以保持
 * Builder 方法的身份，注意：
 *
 *  - wrapBuilder 方法只能传入全局 Builder 方法。
 *  - wrapBuilder 方法返回的 WrappedBuilder 对象的 builder 属性方法只能在 struct 内部使用。
 */
const wrappedOverBuilderByValue: WrappedBuilder<[number]> = wrapBuilder(overBuilderByValue)

/**
 * @Styles 装饰器将多个属性封装到一个方法中。
 *
 *  - 当前 Styles 仅支持通用属性和通用事件。
 *  - Styles 方法不支持参数。
 *  - styles 不能跨文件使用。
 */
@Styles
function redFrame() {
  .borderWidth(1)
  .borderRadius(5)
  .borderColor($r('sys.color.black'))
  .backgroundColor("#FF0000")
  .margin(10)
  .padding(20)
}

/**
 * @Styles 只能封装通用属性，@Extend 可以指定一个用于扩展的组件。
 *
 *  - Extend 只能在 Component 外面定义。
 *  - Extend 方法不支持参数。
 *  - Extend 不能跨文件使用。
 */
@Extend(Text)
function redText() {
  .borderWidth(1)
  .borderRadius(5)
  .borderColor($r('sys.color.black'))
  .backgroundColor("#FF0000")
  .margin(10)
  .padding(20)
  .fontSize(30)
  .fontColor($r('sys.color.black'))
  .fontWeight(FontWeight.Bold)
}

/**
 * stateStyles 可以依据组件的内部状态的不同，stateStyles 是属性方法，可以根据 UI 内部状态来设置样式，类似于 css 伪类，但语法不同。ArkUI 提
 * 供以下五种状态：
 *
 *    - focused：获焦态。
 *    - normal：正常态。
 *    - pressed：按压态。
 *    - disabled：不可用态。
 *    - selected10+：选中态。
 *
 * Styles 和 stateStyles 可以联合使用。
 */
@Extend(Button)
function multiStatedButton() {
  .stateStyles({
    focused: {
      .backgroundColor('#FFFFEEF0')
    },
    pressed: {
      .backgroundColor('#FF707070')
    },
    normal: {
      .backgroundColor('#FFADA7AA')
    }
  })
  .margin(20)
}

/**
 * @AnimatableExtend 装饰器用于自定义可动画的属性方法，在这个属性方法中修改组件不可动画的属性。在动画执行过程时，通过逐帧回调函数修改不可动画属
 * 性值，让不可动画属性也能实现动画效果。也可通过逐帧回调函数每帧修改可动画属性的值，实现逐帧布局的效果。
 */
@AnimatableExtend(Text)
function animatableWidth(width: number) {
  .width(width)
}

@Component
struct StrictChild {
  /**
   * 当 Child 组件内使用 @Require 装饰器和 @Prop、@State、@Provide、@BuilderParam 和普通变量(无状态装饰器修饰的变量)结合使用时，父组件
   * Index 在构造 Child 时必须传参，否则编译不通过。
   */
  @Require @Prop label: string = "Child"

  build() {
    Column() {
      Text(`I am a strict Child: ${this.label}`)
    }
  }
}