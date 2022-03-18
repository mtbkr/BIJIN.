class User < ApplicationRecord
  authenticates_with_sorcery!
  before_create :set_uuid

  validates :password, length: { minimum: 5 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :uuid, uniqueness: true, presence: true
  validates :account_name, presence: true

  enum role: { general: 0, admin: 1 }

  private

  def set_uuid
    self.uuid ||= SecureRandom.alphanumeric(10)
  end
end
