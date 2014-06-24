class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :email, :resident, :volunteer, :corporation, :phone_number, :reference, :reference_contact, :address, :city, :state, :zip, :background_check
end
