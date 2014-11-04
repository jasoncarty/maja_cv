class Page < ActiveRecord::Base
  has_one :template
  accepts_nested_attributes_for :template

  def self.templates
    Template.all
  end
end
