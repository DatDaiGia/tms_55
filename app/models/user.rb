class User < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :following_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses
  has_many :user_subjects, dependent: :destroy
  has_many :course_subjects, through: :user_subjects
  has_many :user_tasks, dependent: :destroy
  has_many :subjects, through: :user_subjects
  has_many :tasks, through: :user_tasks
end
