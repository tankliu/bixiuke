# -*- encoding : utf-8 -*-
class Grade < ActiveRecord::Base
  belongs_to :person
  validates :score, :numericality => {:message => "人数限制必须是整数", :only_integer => true, 
                        :greater_than_or_equal_to => 10,  :less_than_or_equal_to => 100, :allow_blank => true}
end
