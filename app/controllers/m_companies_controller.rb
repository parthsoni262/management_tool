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
    @mcompany = MCompany.new(params.require(:m_companies).permit(:company_name,  
     								                           :email_id, 
    								                           :contact_no))
     respond_to do |format|
       if @mcompany.save
         format.html { redirect_to m_companies_path , notice: 'Data was successfully saved.' }
       else
         format.html { render :new }
       end
     end
  end
  
  # private
  # def mcomapanyparams
  #   params.require(:m_company).permit(:company_name,  
  #   								  :email_id, 
  #   								  :contact_no))
  # end
end 