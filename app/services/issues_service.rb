class IssuesService

  attr_accessor :issue_repository

  def initialize
    @issue_repository = IssueRepository.new
  end

  def load_all_issues
    issue_repository.load_all_issues
  end

  def new_issue(params)
    issue_repository.new_issue(format_params(params))
  end

  def search_by_github_issue_id(github_issue_id)
    issue_repository.search_by_github_issue_id(github_issue_id)
  end

  private

  def format_params(params)
    {
      issue_id: params['id'],
      action: params['action'],
      title: params['title'],
      user: params['user']['login'],
      state: params['state'],
      url: params['url'],
    }
  end

end