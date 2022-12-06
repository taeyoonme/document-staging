# SPDX-FileCopyrightText: Copyright 2022 SK TELECOM CO., LTD.
# SPDX-License-Identifier: Apache-2.0

module Jekyll::Potion
  class EmptyTag < Liquid::Tag
    include PotionTag

    def initialize(tag_name, markup, options)
      super
    end

    def render(page_context)
      @params["potion"] = PagePotion.potion(page_context)

      Potion[:theme].render_template(@template_name, @params)
    end
  end
end

Liquid::Template.register_tag("empty", Jekyll::Potion::EmptyTag)
