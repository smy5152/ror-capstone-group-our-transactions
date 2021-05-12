module TasksHelper
  def display_icon(group, task)
    return unless task.group

    image_tag group.icon, alt: 'group-icon', class: 'group-img'
  end

  def total_tasks_hours(tasks)
    tasks.inject(0) { |acum, task| acum + task.amount }
  end

  def extra_feature_hours_message(hours)
    if hours >= 40
      render partial: 'partials/good_job'
    else
      render partial: 'partials/log_tasks'
    end
  end
end
