module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private

    def not_found(exeption)
      logger.warn exeption
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end
