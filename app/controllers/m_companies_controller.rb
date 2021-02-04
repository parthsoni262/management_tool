class MCompaniesController < ApplicationController
  def index
  	@mcompany = MCompany.all
  end

  def new
  	puts "==========new============"
  	@mcompany = MCompany.new 
  end

  def create
  	puts "============create============="
    @mcompany = MCompany.new(mcomapanyparams)
     respond_to do |format|
       if @mcompany.save
         format.html { redirect_to m_companies_path , notice: 'Data was successfully saved.' }
       else
         format.html { render :new }
       end
     end
  end
  
  private
  def mcomapanyparams
      params.require(:m_company).permit(:company_cd,
									    :company_name,  
									    :address1,
									    :address2,
				              :email_id, 
			                :contact_no)
  end
end 