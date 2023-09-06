class ItemsController < ApplicationController
    def new
        @item = Item.new
    end

    def create
        errors_list = []
        clarence_batch = ClearanceBatch.new
        begin
            item = Item.find(params[:item_id]) 
            if item.status == "sellable"
              item.clearance!
              clarence_batch.items = [item]
              clarence_batch.save!

            else
                errors_list << "Item with 'id'=#{params[:item_id]}, isn't sellable"
            end
          rescue => error
            errors_list << error.message
        end
        flash[:notice]  = "items with id: #{item.id} clearanced in batch #{clarence_batch.id} succesfully" if clarence_batch.persisted?
        flash[:alert] = errors_list.join("<br/>") if errors_list.any?
        redirect_to root_path

    end

end
