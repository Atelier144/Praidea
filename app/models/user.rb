class User < ApplicationRecord
    mount_uploader :raw_image, ImageUploader

    def posts_count
        return Post.where(user_id: self.id).count
    end

    def praises_count
        return Praise.where(user_id: self.id).count
    end

    def praised_count
        count = 0
        posts = Post.where(user_id: self.id)
        posts.each do |post|
            count += Praise.where(post_id: post.id).count
        end
        return count
    end
end
