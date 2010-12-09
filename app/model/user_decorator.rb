
User.class_eval do
  before_validation :check_facebooker

  def self.find_by_facebook_id(id)
    self.where('facebook_id=?', id).first
  end

  def facebooker?
    true unless self.facebook_id.nil?
  end

  protected
    def check_facebooker
      if new_record? and facebooker?
        reset_password
      end
    end
end
