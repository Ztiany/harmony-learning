import Constant from "../common/Constant"

/**
 * Saving and manipulating data displayed on the page.
 */
export class DataModel {

  /**
   * Saved Data.
   */
  private tasks: Array<string> = Constant.TODO_DATA;

  /**
   * Get the data.
   */
  getData(): Array<string> {
    return this.tasks;
  }
}

export default new DataModel();