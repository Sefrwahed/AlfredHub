class Version < ApplicationRecord
  belongs_to :alfred_module

  attr_accessor :uploaded_file

  validates :number, uniqueness: { scope: :alfred_module }, presence: true,
                     format: /\A[0-9]+\.[0-9]+\.[0-9]+\Z/

  before_create :upload_to_storage

  def fetch_from_storage
    GdriveHelper.download(self.alfred_module.name, self.number)
  end

  private

  def upload_to_storage
    archive = GdriveHelper.upload(
      self.alfred_module.name, self.number, uploaded_file.path
    )

    return false if archive.web_content_link.present?
  end
end
