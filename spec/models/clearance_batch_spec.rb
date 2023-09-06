require "rails_helper"

RSpec.describe ClearanceBatch, type: :model do
  describe "#total_price" do
    let(:clearance_batch) do
      FactoryBot.create(:clearance_batch).tap do |clearance_batch|
        3.times do
          FactoryBot.create(
            :item,
            clearance_batch: clearance_batch,
            status: "clearanced",
            price_sold: BigDecimal("6.00"),
          )
        end
      end
    end

    it "returns the sum of the item price sold values" do
      expect(clearance_batch.total_price).to eq(BigDecimal("18.00"))
    end
  end
end
