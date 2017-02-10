class AlfredModule < ApplicationRecord
  has_many :versions

  validates :name, uniqueness: true, presence: true, format: /\A[\w-]+\Z/
  validates :homepage, uniqueness: true, presence: true
  validates :description, presence: true

  before_create :create_storage_folder

  private

  def create_storage_folder
    c = GdriveHelper.create_collection_for_new_module(self.name)
    return false unless c.web_content_link.present?
  end
end
