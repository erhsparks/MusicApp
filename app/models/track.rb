# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  bonus      :boolean          default(FALSE), not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer          not null
#

class Track < ActiveRecord::Base
  belongs_to :album

  has_one :band,
    through: :album
  end
