json.array! @expenses do |expense|
  json.type "pie"
  json.showInLegend false
  json.dataPoints do
    json.array! @expenses do |expense|
      json.y expense.category_id
      json.label Category.find_by(id: expense.category_id).name
    end
  end
end
