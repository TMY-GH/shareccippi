class IngredientsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, values)
    i = 1
    values.each do |v|
      if v == "1" || v == "6" || v == "23" || v == "32" || v == "37"
        record.errors[attribute] << (options[:message] || "(#{i}つ目)が選択されていません")
      end
      i += 1
    end
  end
end