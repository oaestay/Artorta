# frozen_string_literal: true

module TagBehaviour
  extend ActiveSupport::Concern

  def normalize_string(a)
    I18n.transliterate(a).gsub(/[^0-9A-Za-z_ ]/, '').strip.parameterize(separator: '_')
  end

  def remove_stopwords(tag_list)
    tag_list.map{ |x| normalize_string(x) }.select{|x| !STOP_WORDS.include?(x)}
  end
end
