class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

    def facebook_app_id
      '354710254577705'
    end
    helper_method :facebook_app_id

    def facebook_app_secret
      'e9d3633379d99560f7b66df6294b0920'
    end
    helper_method :facebook_app_secret

end
