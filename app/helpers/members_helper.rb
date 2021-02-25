module MembersHelper
  def decorate_short_url(member)
    "#{request.base_url}/short/#{member.short_url}"
  end
end
