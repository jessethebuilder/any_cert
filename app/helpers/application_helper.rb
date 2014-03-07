module ApplicationHelper
  include HtmlTools

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

end
