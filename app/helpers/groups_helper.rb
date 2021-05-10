module GroupsHelper
  def display_eye(task)
    render 'eye' if current_user == task.author
  end

  def display_modify(group)
    render 'modify' if current_user == group.user
  end
end
