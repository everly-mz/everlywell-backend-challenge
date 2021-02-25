class ExpertController < ApplicationController
  def index
    Rails.logger.info expert_params.inspect

    @result = []

    if expert_params['query']
      @member = Member.find_by(id: expert_params['member_id'])
      res = @member.friends.as(:f).headlines.where(heading: expert_params['query'].strip).pluck('f')

      if res.empty?
        res = Headline.where(heading: expert_params['query'].strip).experts.as(:e).pluck('e')
      end

      @result = res
    end
  end

  private
  def expert_params
    params.permit(:member_id, :query, :commit)
  end
end