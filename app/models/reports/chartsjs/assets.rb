module Reports
  module Chartsjs
    class Assets
      def initialize(user)
        @user = user
        @pie_accounts = @user.accounts
      end

      def report
        {
          datasets: datasets,
          labels: labels
        }
      end

      def total_balance
        balance = 0
        @user.accounts.each do |account|
          balance += account.balance
        end
        balance
      end

      def total_expenses
        expenses = 0
        @user.accounts.each do |account|
          expenses += account.total_expenses
        end
        expenses
      end

      private

      def datasets
        datasets = {
          data: [],
          backgroundColor: []
        }

        @pie_accounts.map do |account|
          datasets[:data] << account.balance.round(2)
          datasets[:backgroundColor] << color(account.label)
        end

        [datasets]
      end

      def labels
        @pie_accounts.pluck(:label)
      end

      def color(label)
        label_colors[label.to_sym]
      end

      def label_colors
        Account.all.inject({}) do |memo, values|
          memo[values.label.to_sym] = "##{Digest::SHA256.hexdigest(values.label)[10..15]}"
          memo
        end
      end
    end
  end
end
