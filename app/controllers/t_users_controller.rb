class TUsersController < ApplicationController
  def index
    @tuser = TUsers.all
  end

  def new
    binding.pry
    @tuser = TUsers.new
  end

  def create
    #binding.pry
    puts "============create============="
    @tuser = TUsers.new(tusersparams)
     respond_to do |format|
       if @tuser.save
         format.html { redirect_to t_user_index_path , notice: 'Data was successfully saved.' }
       else
         format.html { render :new }
       end
     end
  end
  private
  def tusersparams
    params.require(:t_user).permit(:first_name,
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
end