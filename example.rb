require_relative './lib/mixiner'

# Lets rewrite enum using mixiner

module Enum

  include Mixiner

  def enum definitions
    definitions.each do |name, values|
      values.each_with_index do |value, index|
        define_mixin_method self, 'Enum', "#{ value }!" do
          @attributes[name] = index
        end
      end
      define_method name do
        current = @attributes[name] || 0
        values[current]
      end
    end
  end

end

class Post
  extend Enum

  def initialize
    @attributes = {}
  end

  attr_reader :archived_at
  enum status: [:draft, :public, :archived]

  def archived!
    @archived_at = Time.now
    super
  end
end

post = Post.new

assert_equal post.status, :draft

post.public!

assert_equal post.status, :public

post.archived!

assert_equal post.status, :archived
assert post.archived_at, 'Stores archived date'
