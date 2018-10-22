json.array! @expenses do |expense|
  json.type "stackedColumn"
  json.showInLegend false
  json.dataPoints do
    json.array! @expenses do |expense|
      json.y expense.id
      json.label Purchase.find_by(id: expense.purchase_id).name_purchases
    end
  end
end
