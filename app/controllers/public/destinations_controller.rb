class Public::DestinationsController < ApplicationController

  def create
    @destination = Destination.new(destination_params)
    @destination.customer_id = current_customer.id
    if @destination.save
     flash[:notice] = "Item was successfully created."
     redirect_to destinations_path
    else
     @destinations = Destination.all
     render :index
    end
  end

  def index
    @destinations = Destination.all
    @destination = Destination.new
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
   if   @destination.update(destination_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to destinations_path
   else
    render :edit
   end
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    redirect_to destinations_path
  end

  def destination_params
    params.require(:destination).permit(:name, :postal_code, :address)
  end

end
