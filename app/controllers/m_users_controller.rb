class MUsersController < ApplicationController

  before_action :set_m_user , only: [:edit, :destroy, :update]
  
  def index
    @muser = MUser.all
  end

  def show
  end

  def new
    @muser = MUser.new
    @companies = MCompany.pluck(:company_name, :id)
  end

  def edit
  end

  def create
    binding.pry
  	puts "============create============="
    @muser = MUser.new(m_users_params)
     respond_to do |format|
       if @muser.save
         format.html { redirect_to m_users_path , notice: 'Data was successfully saved.' }
       else
         @companies = MCompany.pluck(:company_name, :id)
         format.html { render :new }
       end
     end
  end

  def update
    respond_to do |format|
      if @muser.update(m_users_params)
        format.html { redirect_to m_users_path, notice: 'Data was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @muser.destroy
    respond_to do |format|
      format.html { redirect_to m_users_path , notice: 'Data was successfully deleted.' }
    end
  end
  
  private
  def m_users_params
    params.require(:m_user).permit(:user_id,
                                   :mail_id,
                                   :m_company_id,
									                 :password)  
  end

  def set_m_user
    @muser = MUser.find_by(id: params[:id])
  end

end