require 'rails_helper'

RSpec.describe ItemsQuery do
  describe '.retrieve' do
    subject(:retrieved_itens) do
      described_class.retrieve(completed_at: completed_at)
    end

    let!(:incompleted_item_1) { Item.create! }
    let!(:incompleted_item_2) { Item.create! }
    let!(:completed_item_1) do
      Item.create!(completed_at: Date.new(2017, 10, 23))
    end
    let!(:completed_item_2) do
      Item.create!(completed_at: Date.new(2017, 10, 23))
    end
    let!(:completed_item_3) do
      Item.create!(completed_at: Date.new(2017, 10, 22))
    end

    context 'when completed_at is nil' do
      let(:completed_at) { nil }

      it 'returns all and only the incomplete items' do
        expect(retrieved_itens).to match(
          [incompleted_item_1, incompleted_item_2]
        )
      end
    end

    context 'when completed_at is a valid date' do
      let(:completed_at) { Date.new(2017, 10, 23) }

      it 'returns the items completed at that date only' do
        expect(retrieved_itens).to match(
          [completed_item_1, completed_item_2]
        )
      end
    end
  end
end
