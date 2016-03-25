require "contact_manager/version"
require "contact_manager/csv_data"

module ContactManager
  def self.find_by_letter(csv_file, letter)
    ContactManager::CsvData.new(csv_file).find_by_letter(letter)
  end

  def self.find_by_email(csv_file, email)
    ContactManager::CsvData.new(csv_file).find_by_email(email)
  end
end
