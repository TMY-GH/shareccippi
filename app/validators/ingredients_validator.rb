class IngredientsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, values)
    if values == nil || values == ""
      return
    end
    i = 1
    values.each do |v|
      if v == "1" || v == "6" || v == "22" || v == "30" || v == "35" || v.to_i >= 48
        record.errors[attribute] << (options[:message] || "(#{i}つ目)が選択されていません")
      end
      i += 1
    end
  end
end