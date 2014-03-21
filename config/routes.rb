PortalBase::Application.routes.draw do

  devise_for :users

  comfy_route :cms_admin, :path => '/admin'
  comfy_route :cms, :path => '/', :sitemap => false

end
