# SPDX-FileCopyrightText: Copyright 2022 SK TELECOM CO., LTD.
# SPDX-License-Identifier: Apache-2.0

module Jekyll::Potion
  class Favicons
    attr_reader :favicons

    def initialize
      @favicons = {}
    end

    def add(path, file)
      @favicons[path] = file unless @favicons.has_key?(path)
    end

    def contains?(path)
      @favicons.has_key?(path)
    end

    def keys
      @favicons.keys
    end

    def values
      @favicons.values
    end
  end
end
