class AuthorizedController < ApplicationController

  before_filter :authenticate_user!

end