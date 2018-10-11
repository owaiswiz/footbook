ActiveAdmin.register Player do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  # actions :all

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :position
    column :nationality
    column :club
    column :goals
    column :age
    column :height
    actions
  end

  filter :name
  filter :nationality
  filter :club
  filter :goals
  form do |f|
    f.inputs
    f.inputs 'Player Image' do
      f.input :player_image, as: :file
    end
    f.actions
  end
end
