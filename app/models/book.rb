class Book < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged
	
	belongs_to :user
	has_attached_file :image
	has_attached_file :resource

	validates_attachment_content_type :image,
	content_type: /^image\/(png|gif|jpeg)/,
	message: "Only Images Allowed"  

	validates_attachment_content_type :resource,
	content_type: ['application/pdf'],
	message: "Only pdfs allowed"

	validates :image, attachment_presence: true
	validates :resource, attachment_presence: true

end
