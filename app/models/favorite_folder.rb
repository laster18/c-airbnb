class FavoriteFolder < ApplicationRecord
  enum release: { everyone: 0, invite_only: 1}
end
