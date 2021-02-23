class TUsersController < ApplicationController

  before_action :set_t_user , only: [:edit, :destroy, :update]

  def index
    @tuser = TUserMaster.all
  end

  def new
   # binding.pry
    @tuser = TUserMaster.new
    @musers = MUser.pluck(:id)    
    @mroles = MRole.pluck(:id)
    @mgenders = MGender.pluck(:id)
  end

  def show
  end

  def edit
  end

  def create
    #binding.pry
    puts "============create============="
    @tuser = TUserMaster.new(t_users_params)
     respond_to do |format|
       if @tuser.save
         format.html { redirect_to t_user_index_path , notice: 'Data was successfully saved.' }
       else
         format.html { render :new }
       end
     end
  end

  def update
    respond_to do |format|
      if @tuser.update(t_users_params)
        format.html { redirect_to t_users_path, notice: 'Data was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tuser.destroy
    respond_to do |format|
      format.html { redirect_to t_users_path , notice: 'Data was successfully deleted.' }
    end
  end

  private
  def t_users_params
    params.require(:t_user_master).permit(:first_name,
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