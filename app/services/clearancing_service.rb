require 'csv'
require 'ostruct'
class ClearancingService

  def process_file(uploaded_file)
    clearancing_status = create_clearancing_status

    CSV.foreach(uploaded_file, headers: false) do |row|
      item_id = row[0]
      clearancing_status.item_ids_to_clearance << item_id
    end

    clearance_items!(clearancing_status)
  end

private

  def clearance_items!(clearancing_status)
    clearancing_status.item_ids_to_clearance.each do |item_id|
      begin
        item = Item.find(item_id) 
        if item.status == "sellable"
          item.clearance!
          clearancing_status.clearance_batch.items << item
        else
          clearancing_status.errors << "Item with 'id'=#{item_id}, isn't sellable"
        end
      rescue => error
        clearancing_status.errors << error.message
      end
    end

    if clearancing_status.clearance_batch.items.any?
      clearancing_status.clearance_batch.save!
    end

    clearancing_status
  end

  def create_clearancing_status
    OpenStruct.new(
      clearance_batch: ClearanceBatch.new,
      item_ids_to_clearance: [],
      errors: [])
  end
end
