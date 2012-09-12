# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  belongs_to :person
  belongs_to :commable, :polymorphic=> true
  validates :content, :length => {:in => 1..100000, :message => "评论字数在1到10万之间"}
end
