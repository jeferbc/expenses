json.array! @expenses do |expense|
  json.type "pie"
  json.showInLegend false
  json.dataPoints do
    json.array! @expenses do |expense|
      json.y expense.id
      json.label expense.category_id
    end
  end
end
