require 'csv'

module ContactManager
  class CsvData
    def initialize(csv_file)
      @csv_file = csv_file
      @contact_data = nil
      load_csv
    end

    def load_csv
      @contact_data = CSV.read(@csv_file, headers:true, :encoding => 'windows-1251:utf-8')
    end

    def find_by_letter(letter)
      filtered_data = @contact_data.select do |contact|
        contact["last_name"].downcase[0,1] == letter.downcase
      end
      filtered_data = filtered_data.map do |contact|
        format_row(contact)
      end
      filtered_data
    end

    def find_by_email(email)
      filtered_data = @contact_data.select do |contact|
        contact["email"].downcase == email.downcase
      end
      filtered_data = filtered_data.map do |contact|
        format_row(contact)
      end
      filtered_data.empty? ? nil : filtered_data.first
    end

    private

    def format_row(row)
      "Last: #{row["last_name"]}, First: #{row["first_name"]}, Phone: #{row["phone"]}, E-Mail: #{row["email"]}"
    end
  end
end
