class JobSerializer < ActiveModel::Serializer
  attributes :id, :time_preference, :tools, :type, :duration, :recurring, :location, :contact_phone, :contact_email, :user_id, :user
end
