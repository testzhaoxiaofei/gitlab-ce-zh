module Gitlab
  module CycleAnalytics
    class PlanStage < BaseStage
      def start_time_attrs
        @start_time_attrs ||= [issue_metrics_table[:first_associated_with_milestone_at],
                               issue_metrics_table[:first_added_to_board_at]]
      end

      def end_time_attrs
        @end_time_attrs ||= issue_metrics_table[:first_mentioned_in_commit_at]
      end

      def name
        :plan
      end

      def legend
        "Related Commits"
      end

      def description
        "一个问题从提出到开始实现的时间"
      end
    end
  end
end
