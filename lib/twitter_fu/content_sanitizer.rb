module TwitterFu
  module ContentSanitizer
    def content
      @__content ||= title.gsub(/^#{@__username}\:\s*/, '')
    end
  end
end