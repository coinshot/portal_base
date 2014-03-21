PortalBase::Application.routes.draw do

  devise_for :users

  comfy_route :cms_admin, :path => '/admin'
  comfy_route :cms, :path => '/', :sitemap => false

  root 'cms/content#show'
end
