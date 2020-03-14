class Post < ApplicationRecord
    mount_uploader :image, ImageUploader

    def image?
        return nil if self.image.blank?
        return ""
    end

    def user
        return User.find_by(id: self.user_id)
    end

    def praise_stamps
        return Praise.where(post_id: self.id).group(:stamp_id)
    end

    def stamp_count(stamp_id)
        return Praise.where(post_id: self.id, stamp_id: stamp_id).count
    end
end
