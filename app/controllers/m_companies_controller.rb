class MCompaniesController < ApplicationController
  include ApplicationHelper
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
    #binding.pry
    result = check_email(m_company_params[:email_id])
  	puts "============create============="
    puts result
  
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
        format.html { redirect_to @mcompany, notice: 'Data was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
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
end 

