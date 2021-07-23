class InviteUserValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, values)
    if values == nil || values == ""
      return
    end
    i = 1
    values.each do |value|
      if value.blank?
        record.errors[attribute] << (options[:message] || "（#{i}つ目）を入力してください")
      end
      unless User.find_by(user_name: value)
        record.errors[attribute] << (options[:message] || "（#{i}つ目）は存在しません")
      end
      user = User.find_by(user_name: value)
      if GroupInvitation.find_by(user_id: user.id, group_id: record.group_id) || UserGroup.find_by(user_id: user.id, group_id: record.group_id)
        record.errors[attribute] << (options[:message] || "（#{i}つ目）は既に招待しています")
      end
      i += 1
    end
  end
end