class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "80x80#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def full_name
  	first_name + " " + last_name
  end

  def gravatar_url
  	hash = Digest::MD5.hexdigest(email.strip.downcase)

  	"http://www.gravatar.com/avatar/#{hash}"
  end
end
