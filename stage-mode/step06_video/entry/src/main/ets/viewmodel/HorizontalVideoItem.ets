/**
 * Horizontal picture class.
 *
 * 不同的装饰器仅能观察到第一层的变化，但是在实际应用开发中，应用会根据开发需要，封装自己的数据模型。对于多层嵌套的情况，比如二维数组，或者数组项 class，
 * 或者 class 的属性是 class，它们的第二层的属性变化是无法观察到的。这就引出了 @Observed/@ObjectLink 装饰器。
 *
 * @ObjectLink 和 @Observed 类装饰器用于在涉及嵌套对象或数组的场景中进行双向数据同步：
 *
 *  - 被@ Observed 装饰的类，可以被观察到属性的变化；
 *  - 子组件中 @ObjectLink 装饰器装饰的状态变量用于接收 @Observed 装饰的类的实例，和父组件中对应的状态变量建立双向数据绑定。
 *    这个实例可以是数组中的被 @Observed 装饰的项，或者是 class object 中的属性，这个属性同样也需要被 @Observed 装饰。
 *  - 单独使用 @Observed 是没有任何作用的，需要搭配 @ObjectLink 或者 @Prop 使用。
 */
@Observed
export class HorizontalVideoItem {
  id: number;
  image: Resource;
  name: string;

  constructor(id: number, image: Resource, name: string) {
    this.id = id;
    this.image = image;
    this.name = name;
  }
}