require 'rails_helper'

RSpec.describe Card, type: :model do
  # Association test
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:section) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:image_url) }
  it { should validate_presence_of(:tags) }
end
