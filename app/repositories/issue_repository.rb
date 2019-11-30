class IssueRepository

  attr_accessor :issue

  def initialize
    @issue = Issue
  end

  def load_all_issues
    issue.all
  end

  def new_issue(params)
    new_issue = issue.new(params)
    new_issue.save
  end

  def search_by_github_issue_id(github_issue_id)
    issue.where('issue_id LIKE ?', "%#{github_issue_id}%")
  end

  def find_issue_by_id(id)
    issue.find_by_id(id)
  end
end