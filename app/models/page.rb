class Page < ActiveRecord::Base

  def self.templates
    %w( full_width 2_col )
  end
end
