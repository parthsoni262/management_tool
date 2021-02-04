class MUsersController < ApplicationController
  def index
    @muser = MUser.all
  end
  def new
    @muser = MUser.new
    @companies = MCompany.pluck(:company_name, :id)
  end
  def create
    binding.pry
  	puts "============create============="
    @muser = MUser.new(musersparams)
     respond_to do |format|
       if @muser.save
         format.html { redirect_to m_users_path , notice: 'Data was successfully saved.' }
       else
         format.html { render :new }
       end
     end
  end
  private
  def musersparams
    params.require(:m_user).permit(:user_id,
                                   :mail_id,
                                   :m_company_id,
									                 :password)  
  end
end
