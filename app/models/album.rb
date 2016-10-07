# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_id    :integer          not null
#

class Album < ActiveRecord::Base
  belongs_to :band
  has_many :tracks

  attr_reader :display_title

  def display_title
    title = self.title.to_s
    title += " (Live)" if self.live

    title
  end
end
