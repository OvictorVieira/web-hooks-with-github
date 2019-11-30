require 'rails_helper'

RSpec.describe IssuesController, type: :controller do
  describe "Create issue through webhook event" do
    let(:payload) {
      JSON.parse(file_fixture("issue.json").read)
    }

    it "created status" do
      post :create, { params: payload }

      expect(response.status).to eq(201)
    end

    it 'persistence an issue' do
      post :create, { params: payload }
      mock_issue = payload['issue']
      issue_database = Issue.find_by_issue_id(mock_issue['id'])

      expect(issue_database.present?).to be_truthy
    end
  end

  describe "Search a issue" do

    before do
      statuses = %W[opened edited deleted transferred]

      (0..20).each do |i|
        attributes = {
            issue_id: 100 + i,
            action: statuses[rand(3)],
            title: "issue #{i}",
            user: "user #{i}",
            state: 'open',
            url: "https://api.github.com/repos/Codertocat/Hello-World/issues/#{i}"
        }

        Issue.create(attributes)
      end

    end

    it 'by issue_id on github' do
      issues = IssuesService.new.search_by_github_issue_id(108)

      expect(issues.first.present?).to be_truthy
    end
  end

end
