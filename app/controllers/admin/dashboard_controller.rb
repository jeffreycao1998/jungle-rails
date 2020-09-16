class Admin::DashboardController < ApplicationController
  before_filter :authenticate, :only => [ :show ]

  def show
    @product_count = Product.count
    @category_count = Category.count
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |id, password|
      id == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end

end
