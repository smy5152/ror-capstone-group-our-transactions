module TasksHelper
  def display_icon(group, task)
    return unless task.group

    image_tag group.icon, alt: 'group-icon', class: 'group-img'
  end

  def total_tasks_hours(tasks)
    tasks.inject(0) { |acum, task| acum + task.amount }
  end
end
