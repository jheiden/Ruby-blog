class Article < ActiveRecord::Base

    # Enforcing referential integrity through applying the <dependent: :destroy> method for the <has_many> method.
    # We would otherwise have "orphaned" tags and comments after deleting an article.
    has_many :comments, dependent: :destroy
    has_many :taggings
    has_many :tags, through: :taggings, dependent: :destroy

    # Declaring that paperclip should accept a file attachment and that there are fields to store information about
    # this attachment which starts with image_ in this models DB table.
    has_attached_file :image # <has_attached_file> method is a part of the paperclip library.
    
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

    def tag_list
        self.tags.collect do |tag|
          tag.name
        end.join(", ")
      end
      
    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
        self.tags = new_or_found_tags
    end

end
