module ApplicationHelper
  include Pagy::Frontend

  FLASH_NAME = {  success: 'alert-success', notice: 'alert-success',
                  error: 'alert-danger', alert: 'alert-danger' }.freeze

  def pagination(obj)
    raw(pagy_bootstrap_nav(obj)) if obj.pages > 1
  end

  def bootstrap_class_for_flash(flash_type)
    flash = FLASH_NAME[flash_type.to_sym] || flash_type.to_s
  end

  def currently_at(current_page = '')
    render partial: 'shared/header', locals: { current_page: current_page }
  end

  def full_title(page_title = '')
    base_title = 'AskIt'
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
end
