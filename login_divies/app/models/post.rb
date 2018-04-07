class Post < ActiveRecord::Base
    resourcify
    include Authority::Abilities
    #이로써 @post.updatable_by? 또는 @post.deletable_by?와 같은 메소드를 사용할 수 있게 된다.
    
    
    belongs_to :user
end
