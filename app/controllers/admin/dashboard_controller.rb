class Admin::DashboardController < ApplicationController
  before_filter :authenticate, :only => [ :show ]

  def show
    @product_count = Product.count
    @category_count = Category.count
  end

  private

end
