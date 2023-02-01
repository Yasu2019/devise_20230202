#Rails7+deviseで起こり得るエラーとその対処法
#https://qiita.com/MASAHIDE-HIGASHI/items/1f26c04fb5d5c46ab70b


class TurboDeviseController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_steam
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => error
      if get?
        raise error
      elsif has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_lcation
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_steam
  
end