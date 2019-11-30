class IssuesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @issues = IssuesService.new.load_all_issues
  end

  def create
    success = IssuesService.new.new_issue(issue_params)

    if success
      render json: {response: 'Issue criada!' }, status: :created
    else
      render json: {response: 'Não foi possível criar a issue!' }, status: :unprocessable_entity
    end
  end

  def search_issue
    @issues = IssuesService.new.search_by_github_issue_id(params[:issue_id])
  end

  private

  def issue_params
    permitted_params = params['issue']
    permitted_params.merge('action' => params['action'])
  end
end
