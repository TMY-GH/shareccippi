class AmountValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, values)
    i = 1
    values.each do |value|
      unless /\A[0-9０-９]+\z/.match?(value)
        record.errors[attribute] << (options[:message] || "（#{i}つ目）には数字を入力してください")
      end
      i += 1
    end
  end
end