class StatisticsController < ApplicationController
  def index
    asset = Reports::Chartsjs::Assets.new(current_user)
    @total_balance = asset.total_balance
    @total_expenses = asset.total_expenses
    gon.asset_chart = Reports::Chartsjs::Assets.new(current_user).report
  end
end
