class ApplicationController < ActionController::Base
#  before_filter :authenticate_user!

  before_filter :set_current_locale

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

 private
 
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == 'password'
    end
  end 

 def load_page
    @page = params[:page].blank? ? '1' : params[:page]
    @per_page = params[:per_page].blank? ? '15' : params[:per_page]
  end

  def set_current_locale
    session[:locale] = params[:locale] || session[:locale]
    I18n.locale=( session[:locale] )
  end

  def paginate_model( model, options = {})
    load_page
    model.paginate( { :per_page => @per_page, :page => @page }.merge( options ) )
  end
 
def flash_message
    messages = []
    [:notice, :info, :warning, :error].each do|type|
      if flash[type]
        messages << content_tag( :div, flash[type], :id => type )
      end
    end
    messages.join("\n")
  end

  def partial( name, locals = {} )
    render :partial => name.to_s, :locals => locals
  end

  def page_title
    @page_title || "Real Good Food"
  end

  def after_sign_up_path_for(resource)
     new_profiles_path
  end



end
