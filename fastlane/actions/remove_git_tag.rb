module Fastlane
  module Actions
    module SharedValues
      REMOVE_GIT_TAG_CUSTOM_VALUE = :REMOVE_GIT_TAG_CUSTOM_VALUE
    end

    class RemoveGitTagAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:

        # 获取tag值
        tagName = params[:tag]
        
        # 执行删除本地标签
        Action.sh "git tag -d #{tagName}"

        # 执行删除远端的标签  【git push origin :refs/tags/1.0.0】
        Action.sh "git push origin :refs/tags/#{tagName}"        


      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "删除tag标签🏷"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "如果已经存在了这个tag,删除tag"
      end

      def self.available_options
        # Define all options your action supports.

        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :tag,
                                       env_name: "FL_REMOVE_GIT_TAG_API_TOKEN", # ENV环境变量的名称, 可以通过ENV[FL_REMOVE_GIT_TAG_API_TOKEN]获取
                                       description: "要删除的tag值", # a short description of this parameter
                                       optional: false,
                                      is_string: true),
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        # [
        #   ['REMOVE_GIT_TAG_CUSTOM_VALUE', 'A description of what this value contains']
        # ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["maling"]
      end

      def self.is_supported?(platform)
        # you can do things like
        #
        #  true
        #
        #  platform == :ios
        #
        #  [:ios, :mac].include?(platform)
        #

        platform == :ios
      end
    end
  end
end
