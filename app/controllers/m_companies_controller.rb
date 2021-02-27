class MCompaniesController < ApplicationController
  include ApplicationHelper
  include EmailModule

  before_action :set_m_company , only: [:edit, :destroy, :update]

  def index
  	@mcompany = MCompany.all
  end

  def new
  	puts "==========new============"
  	@mcompany = MCompany.new 
  end

  def show
  end

  def create
    @mcompany = MCompany.new(m_company_params)
     respond_to do |format|
      if @mcompany.save
        format.html { redirect_to m_companies_path , notice: 'Data was successfully saved.' }
       else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @mcompany.update(m_company_params)
        format.html { redirect_to m_companies_path, notice: 'Data was successfully updated.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    binding.pry
    @mcompany = MCompany.find_by(id: params[:id])
    @mcompany.destroy
    respond_to do |format|
      format.html { redirect_to m_companies_path , notice: 'Data was successfully deleted.' }
    end
  end

  private
  def m_company_params
    params.require(:m_company).permit(:company_cd,
                                      :company_name,  
                                      :address1,
                                      :address2,
                                      :email_id, 
                                      :contact_no
                                    )
  end

  def set_m_company
    @mcompany = MCompany.find_by(id: params[:id])
  end
end