class ReportsController < ApplicationController
  before_action :set_sectors
  def index
    company_ids = Account.where(user_id: current_user.id).pluck(:company_id)
    @sectors =  Sector.eager_load(detail_contract: [ :contract ] ).where(contracts: {company_id: company_ids})
    @sectors = @sectors.where(id: params[:search][:sector_id]) if  params[:search].present? && params[:search][:sector_id].present?
    @search_date = params[:search].to_a if params[:search].present?
  end

  def full_report
    user_id = current_user.id
    sectors = Sector.joins(detail_contract: :contract).where('contracts.user_id = ?', user_id)
    sensors_ids = Monitoring.where(sector_id: sectors).pluck(:sensor_id)
    @reports = Report.eager_load(:sensor).where(sensor_id: sensors_ids).order('reports.sent_at desc, sensors.id_sensor asc')
    @reports = @reports.paginate(page: params[:page], per_page: 60)
  end

  private

  def set_sectors
    company_ids = Account.where(user_id: current_user.id).pluck(:company_id)
    @filter_sector = Sector.joins(detail_contract: [ :contract ] ).where(contracts: {company_id: company_ids})
  end
end
