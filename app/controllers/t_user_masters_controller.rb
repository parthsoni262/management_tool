class TUserMastersController < ApplicationController

  before_action :set_t_user , only: [:edit, :destroy, :update]

  def index
    @tuser = TUserMaster.all
  end

  def new
    @tuser = TUserMaster.new
    @musers = MUser.pluck(:user_id, :id)    
    @mgenders = MGender.pluck(:gender_name, :id)
    @mroles = MRole.pluck(:role_name, :id)    
  end

  def show
  end

  def edit
    @musers = MUser.pluck(:user_id, :id) 
    @mgenders = MGender.pluck(:gender_name, :id)
    @mroles = MRole.pluck(:role_name, :id) 
  end

  def create
    puts "============create============="
    @tuser = TUserMaster.new(t_users_params)
     respond_to do |format|
       if @tuser.save
        format.html { redirect_to t_user_masters_path , notice: 'Data was successfully saved.' }
       else
        @musers = MUser.pluck(:user_id, :id)    
        @mgenders = MGender.pluck(:gender_name, :id)
        @mroles = MRole.pluck(:role_name, :id)
        format.html { render :new }
       end
     end
  end

  def update
    binding.pry
    respond_to do |format|
      if @tuser.update(t_users_params)
        format.html { redirect_to t_user_masters_path, notice: 'Data was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tuser.destroy
    respond_to do |format|
      format.html { redirect_to t_user_masters_path , notice: 'Data was successfully deleted.' }
    end
  end

  private
  def t_users_params
    params.require(:t_user_master).permit(:m_user_id,
                                          :m_gender_id, 
                                          :m_role_id,
                                          :first_name,
                                          :last_name,
                                          :contact_no,
                                          :parents_contact_no,
                                          :address,
                                          :zairyo_card,
                                          :zairyo_card_expire_date,
                                          :adhar_card,
                                          :passport,
                                          :passport_expire_date,
                                          :my_number,
                                          :user_name
                                        )  
  end

  def set_t_user
    @tuser = TUserMaster.find_by(id: params[:id])
  end

end