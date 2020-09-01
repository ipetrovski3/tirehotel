class ClientsController < ApplicationController
  before_action :set_warehouse, except: %i[create update search destroy]
  before_action :set_warehouse, expect: %i[new create search destroy]

  def new
    @client = @warehouse.clients.build
    @client.tireinfos.build
    @client.vehicleinfos.build
  end

  def create
    @client = @warehouse.clients.build(client_params)
    if @client.save
      redirect_to [@warehouse, @client]
    else
      render :new
    end
  end

  def edit
    @client.tireinfos.build if @client.tireinfos.blank?
    @client.vehicleinfos.build if @client.vehicleinfos.blank?
  end

  def update
    if @client.update(client_params)
      redirect_to warehouse_client_path
    else
      render :edit
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'application',
               template: 'clients/show.html.erb',
               layout: 'pdf.html',
               encoding: 'utf-8',
               page_size: 'a4',
               orientation: 'Portrait'
      end
    end
  end

  def search
    @client = Client.search(params[:query])
  end

  def destroy
    client = Client.find(params[:id])

    if client.delete
      redirect_to root_path
    else
      render :show
    end
  end

  def transfer; end

  private

  def set_warehouse
    @warehouse = @warehouse.find(params[:warehouse_id])
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :email, :phone, :warehouse_id,
                                   tireinfos_attributes: %i[id dimension brand qty wheels _destroy season_id],
                                   vehicleinfos_attributes: %i[id brand plate _destroy])
  end
end
