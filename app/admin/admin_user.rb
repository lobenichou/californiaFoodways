ActiveAdmin.register AdminUser do
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
    end
    f.actions
  end


  after_create { |admin| admin.send_reset_password_instructions }
  def password_required?
    new_record? ? false : super
  end

end
