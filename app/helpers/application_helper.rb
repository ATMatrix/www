module ApplicationHelper
  def cn_user?
    I18n.locale.to_s == 'zh-CN'
  end
end
