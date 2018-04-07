class User < ActiveRecord::Base
  rolify
  #이로써 current_user.can_update? 또는 current_user.can_delete?와 같은 메소드를 사용할 수 있게 된다.
  include Authority::UserAbilities
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        #:confirmable
  after_create :set_default_role, if: Proc.new { User.count > 1 }

  private

  def set_default_role
    add_role :user
  end

end
