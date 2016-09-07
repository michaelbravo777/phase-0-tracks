class TodoList
  attr_accessor :do_list

  def initialize(list_array)
    @do_list = list_array
  end

  def get_items
    @do_list
  end

  def add_item(new_item)
    @do_list << new_item
  end

  def delete_item(delete_item)
    @do_list.delete(delete_item)
  end

end