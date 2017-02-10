module GdriveHelper
  class << self
    @@root_collection_title = "AlfredHub"
    @@gdrive_session = GoogleDrive::Session.from_config(
      "#{Rails.root}/config/storage_conf.json"
    )

    def create_collection_for_new_module(module_name)
      collection = @@gdrive_session.file_by_title([@@root_collection_title])
      collection.create_subcollection(module_name)
    end

    def upload(module_name, version, uploaded_file)
      collection = @@gdrive_session.file_by_title(
        [@@root_collection_title, module_name]
      )

      collection.upload_from_file(
        uploaded_file,
        "#{version}.zip",
        convert: false
      )
    end

    def download(module_name, version)
      dl_file_name = "#{Rails.root.to_s}/tmp/#{module_name}_#{version}.zip"

      if File.exist? dl_file_name
        return dl_file_name
      end

      file = @@gdrive_session.file_by_title(
        [@@root_collection_title, module_name, "#{version}.zip"]
      )

      file.download_to_file(dl_file_name)

      dl_file_name
    end
  end
end
