module ApplicationHelper
  def session_partials
    if logged_in?
      render partial: 'partials/signedin'
    else
      render partial: 'partials/notsignedin'
    end
  end

  def verbose_date(date)
    date.strftime('%B-%d-%y')
  end

  def show_errors(model)
    pluralize(model.errors.count, 'error') if model.errors.any?
  end

  def show_notice
    content_tag(:div, notice, class: 'notice-box') if notice
  end

  def show_alert
    content_tag(:div, alert, class: 'alert-box') if alert
  end
end
