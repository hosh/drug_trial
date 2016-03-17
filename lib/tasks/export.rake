
# For the sake of speed, going to embed this here fist
# If I have time, I'll add this to lib/

# @param [String] sql
# #   Ex: "insert into volunteers (first_name, last_name, phone_number, insurance_carrier, medical_id), values('daniel', 'lo', '000-000-0000', 'fruitcake',' 123')"
# # @return [Boolean]
# def send_to_hospitial(sql)
#  Rails.logger.debug(sql)
#  File.open('output.sql', 'a+t') do | file |
#    puts sql
#  end
#  true
# end

# Was going to use the postgresq-copy gem but realized this won't work.

namespace :db do
  desc 'Drops and rebuilds db from scratch'
  task export: %w(environment) do
    def export_data
      # Probably better ways to do inserts, such as Postgresql COPY
      Volunteer.all.map do |volunteer|
        "insert into volunteers (first_name, last_name, phone_number, insurance_carrier, medical_id), values('#{volunteer.first_name}', '#{volunteer.last_name}', '#{volunteer.phone_number}', '#{volunteer.insurance_carrier}','#{volunteer.medical_id}'"
      end.join("\n")
    end

    def send_to_hospital(sql)
     Rails.logger.debug(sql)
     File.open('output.sql', 'a+t') do | file |
       file.puts sql
     end
     true
    end

    send_to_hospital(export_data)
  end
end
