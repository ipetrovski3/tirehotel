class ClientsController < ApplicationController
  def new
    @warehouse = Warehouse.find(params[:warehouse_id])

    @client = @warehouse.clients.build
    @client.tireinfos.build
    @client.vehicleinfos.build
  end

  def create
    @warehouse = Warehouse.find(params[:warehouse_id])
    @client = @warehouse.clients.build(client_params)
    if @client.save
      redirect_to [@warehouse, @client]
    else
      render :new
    end
  end

  def edit
    @warehouse = Warehouse.find(params[:warehouse_id])

    @client = Client.find(params[:id])
    @client.tireinfos.build if @client.tireinfos.blank?
    @client.vehicleinfos.build if @client.vehicleinfos.blank?
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to warehouse_client_path
    else
      render :edit
    end
  end

  def show
    @client = Client.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'application',
               template: 'clients/show.html.erb',
               layout: 'pdf.html',
               encoding: 'utf-8',
               page_size: 'a4',
               orientation: 'Portrait',
               grayscale: true
      end
    end
  end

  def search
    @client = Client.search(params[:query])
  end

  def destroy
    client = Client.find(params[:id])

    client.delete
  end

  def transfer
    @warehouse = Warehouse.find(params[:warehouse_id])

    @client = Client.find(params[:id])

  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :phone, :warehouse_id,
                                   tireinfos_attributes: %i[id dimension brand qty wheels _destroy],
                                   vehicleinfos_attributes: %i[id brand plate _destroy])
  end
end
