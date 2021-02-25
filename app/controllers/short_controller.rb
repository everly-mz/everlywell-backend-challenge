class ShortController < ApplicationController
  def show
    member = Member.find_by(short_url: short_params['short_url'])

    redirect_to member.nil? ?
      members_path
      : member.url
  end

  private
  def short_params
    params.permit(:short_url)
  end
end