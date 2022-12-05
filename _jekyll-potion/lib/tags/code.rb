# SPDX-FileCopyrightText: Copyright 2022 SK TELECOM CO., LTD.
# SPDX-License-Identifier: Apache-2.0

module Jekyll::Potion
  class CodeTag < Liquid::Block
    CODE_BLOCK_START = Regexp.new(%r!\A`{3,}!im).freeze
    CODE_BLOCK_END = Regexp.new(%r!`{3,}\z!im).freeze

    CODE_BLOCK = Regexp.new(%r!\A`{3,}(.*)`{3,}\z!im).freeze

    include PotionTag

    def initialize(tag_name, markup, options)
      @body = ""
      super
    end

    def parse(tokens)
      block_open = false

      while (token = tokens.shift)
        strip_token = token.strip

        if CODE_BLOCK.match?(strip_token)
          @body << token
          next
        end

        if not block_open and CODE_BLOCK_START.match?(strip_token)
          block_open = true
        end

        if not block_open and strip_token == @end_tag_name
          return
        end

        @body << token if block_open

        if block_open and CODE_BLOCK_END.match?(strip_token)
          block_open = false
        end
      end

      raise SyntaxError, parse_context.locale.t("errors.syntax.tag_never_closed", block_name: @end_tag_name) unless block_open
      raise SyntaxError, "code block is not closed" if block_open
    end

    def nodelist
      [@body]
    end

    def blank?
      @body.empty?
    end

    def render(page_context)
      @params["body"] = Potion[:site].markdown_convert(@body)
      @params.merge!(Potion[:tags][:code])

      Potion[:theme].render_template(@template_name, @params)
    end
  end
end

Liquid::Template.register_tag("code", Jekyll::Potion::CodeTag)
