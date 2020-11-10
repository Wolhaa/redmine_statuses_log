class IssueStatusHistory < ActiveRecord::Base
  unloadable

  belongs_to :status, :class_name => 'IssueStatus', :foreign_key => 'status_id'
  belongs_to :user
  belongs_to :journal
  belongs_to :issue
end
