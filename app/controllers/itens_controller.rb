class ItensController < ApplicationController
  def index
    render json: {
      data: {
        todays_itens: ItemsQuery.retrieve.map(&:to_h),
        yesterdays_itens: ItemsQuery.retrieve(completed_at: Date.yesterday).map(&:to_h),
        todays_complete_itens: ItemsQuery.retrieve(completed_at: Date.today).map(&:to_h),
      }
    }
  end

  def create
    item = Item.create(description: params[:description])

    if item.save!
      render json: { data: item.to_h }
    else
      render json: { error: 'item not created' }
    end
  end

  def toggle
    item = Item.find(params[:iten_id])

    if item
      item.toggle!
      render json: { data: item.to_h }
    else
      render json: { error: 'item not toggled' }
    end
  end
end
