class Attachment < ApplicationRecord
  belongs_to :task
  mount_uploader :location, AttachmentUploader
end
