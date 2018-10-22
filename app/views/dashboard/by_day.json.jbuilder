json.array! @expenses do |expense|
  json.type "bar"
  json.showInLegend false
  json.dataPoints do
    json.array! @expenses do |expense|
      json.y Purchase.find_by(id: expense.purchase_id).name_purchases

      json.label expense.amount
    end
  end
end
