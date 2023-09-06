require 'rails_helper'

RSpec.describe Item do
  describe "#perform_clearance!" do

    let(:wholesale_price) { 100 }
    let(:item) { FactoryBot.create(:item, style: FactoryBot.create(:style, wholesale_price: wholesale_price)) }
    before do
      item.clearance!
      item.reload
    end

    it "should mark the item status as clearanced" do
      expect(item.status).to eq("clearanced")
    end

    it "should set the price_sold as 75% of the wholesale_price" do
      expect(item.price_sold).to eq(BigDecimal(wholesale_price) * BigDecimal("0.75"))
    end
  end
end
