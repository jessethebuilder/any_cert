module ApplicationHelper
  include HtmlTools
  include RestHelper

  def store
    Store.first || Store.new
  end

  def brand_name(klass: 'navbar-brand')
    if store
      link_to store_name, root_path, :class => klass
    else
      link_to store_name, new_store_path, :class => klass
    end
  end

  def store_name
    if store.new_record?
      'Your Store Here'
    else
      store.name
    end
  end

  #for Devise
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  ##OAuth
  #def oauth
  #  @oauth ||= Koala::Facebook::OAuth.new(store.facebook_id, store.facebook_secret)
  #end
  #
  #def access_token_code_url(callback_url)
  #  oauth.url_for_oauth_code(:permissions => facebook_permissions, :redirect_uri => callback_url)
  #end
  #
  #def access_token(url)
  #
  #end
  #
  #
  ##Facebook Helpers (using Koala)
  #def fb_api
  #  @fb_api = Koala::Facebook::API.new()
  #end



end
