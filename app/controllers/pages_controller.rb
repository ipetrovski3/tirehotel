class PagesController < ApplicationController
  def home
    @warehouses = Warehouse.all
  end
end
