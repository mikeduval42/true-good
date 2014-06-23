class JobSerializer < ActiveModel::Serializer
	# delegate :current_user, to: :scope

  attributes :id, :time_preference, :tools, :type_of_work, :duration, :recurring, :location, :contact_phone, :contact_email, :created_at, :user_id, :user
end
