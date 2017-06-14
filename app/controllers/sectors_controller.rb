class SectorsController < ApplicationController
  before_action :authenticate_user!
  def index
    company_ids = Account.where(user_id: current_user.id).pluck(:company_id)
    @sectors =  Sector.eager_load(detail_contract: [ :contract ] ).where(contracts: {company_id: company_ids})

  end

end
