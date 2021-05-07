module ApplicationHelper
  def session_partials
    if logged_in?
      render partial: 'partials/signedin'
    else
      render partial: 'partials/notsignedin'
    end
  end
end
