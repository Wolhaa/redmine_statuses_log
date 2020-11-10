require 'redmine'

require 'statuses_log/patches/issue_patch'
require 'statuses_log/patches/journal_detail_patch'

module TabIssueHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method :issue_history_tabs_without_log_tab, :issue_history_tabs
      alias_method :issue_history_tabs, :issue_history_tabs_with_log_tab
    end
  end

  module InstanceMethods
    def issue_history_tabs_with_log_tab
      tabs = issue_history_tabs_without_log_tab
      tabs << {:name => 'statuses_log',  :label => :label_issue_history_statuses_log, :partial => 'issues_statuses_log/view_show_statuses_log', :locals => {:issue => @issue}}
      return tabs
    end
  end
end

IssuesHelper.send(:include, TabIssueHelperPatch)

Redmine::Plugin.register :statuses_log do
  name 'Statuses Log plugin'
  author 'Nataliya Skorobogatko'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'https://github.com/Wolhaa'
end
