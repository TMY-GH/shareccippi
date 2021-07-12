class ContentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, values)
    if values == nil || values == ""
      return
    end
    i = 1
    values.each do |value|
      if value.blank?
        record.errors[attribute] << (options[:message] || "（#{i}つ目）を入力してください")
      end
      i += 1
    end
  end
end