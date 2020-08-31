class PagesController < ApplicationController

  def login
    
  end

  def home
    @warehouses = Warehouse.all
  end
end
