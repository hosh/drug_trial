json.array!(@volunteers) do |volunteer|
  json.extract! volunteer, :id, :first_name, :last_name, :phone_number, :insurance_carrier, :medical_id
  json.url volunteer_url(volunteer, format: :json)
end
