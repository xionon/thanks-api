json.messages(@messages) do |message|
   json.extract! message, :id, :body, :recipient
end
