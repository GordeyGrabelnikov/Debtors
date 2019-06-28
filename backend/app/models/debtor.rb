class Debtor < ApplicationRecord
    has_many :debits, :dependent => :delete_all
    mount_uploader :image, ImageUploader
end
