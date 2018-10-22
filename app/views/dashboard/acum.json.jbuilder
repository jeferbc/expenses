json.array! @expenses do |expense|
  json.type "stackedArea"
  json.showInLegend false
  json.dataPoints do
    json.array! @expenses do |expense|
      json.y expense.amount
      json.label expense.date_expense
    end
  end
end
