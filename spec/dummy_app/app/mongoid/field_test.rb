class FieldTest
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name, :type => String
  field :title, :type => String
  field :subject, :type => String
  field :short_text, :type => String

  field :array_field, :type => Array
  field :big_decimal_field, :type => BigDecimal
  field :boolean_field, :type => Boolean
  field :bson_object_id_field, :type => BSON::ObjectId
  field :date_field, :type => Date
  field :datetime_field, :type => DateTime
  field :float_field, :type => Float
  field :hash_field, :type => Hash
  field :integer_field, :type => Integer
  field :object_field, :type => Object
  field :string_field, :type => String
  field :text_field, :type => String
  field :time_field, :type => Time

  field :format, :type => String
  field :restricted_field, :type => String
  field :protected_field, :type => String
  has_mongoid_attached_file :paperclip_asset, :styles => { :thumb => "100x100>" }

  attr_accessible :comment_attributes, :nested_field_tests_attributes, :dragonfly_asset, :remove_dragonfly_asset, :retained_dragonfly_asset, :carrierwave_asset, :carrierwave_asset_cache, :remove_carrierwave_asset, :paperclip_asset, :delete_paperclip_asset, :comment_id, :name, :string_field, :text_field, :integer_field, :float_field, :decimal_field, :datetime_field, :timestamp_field, :time_field, :date_field, :boolean_field, :array_field, :hash_field, :created_at, :updated_at, :format
  attr_accessible :comment_attributes, :nested_field_tests_attributes, :dragonfly_asset, :remove_dragonfly_asset, :retained_dragonfly_asset, :carrierwave_asset, :carrierwave_asset_cache, :remove_carrierwave_asset, :paperclip_asset, :delete_paperclip_asset, :comment_id, :name, :string_field, :text_field, :integer_field, :float_field, :decimal_field, :datetime_field, :timestamp_field, :time_field, :date_field, :boolean_field, :array_field, :hash_field, :created_at, :updated_at, :format, :restricted_field, :as => :custom_role
  attr_accessible :comment_attributes, :nested_field_tests_attributes, :dragonfly_asset, :remove_dragonfly_asset, :retained_dragonfly_asset, :carrierwave_asset, :carrierwave_asset_cache, :remove_carrierwave_asset, :paperclip_asset, :delete_paperclip_asset, :comment_id, :name, :string_field, :text_field, :integer_field, :float_field, :decimal_field, :datetime_field, :timestamp_field, :time_field, :date_field, :boolean_field, :array_field, :hash_field, :created_at, :updated_at, :format, :protected_field, :as => :extra_safe_role

  has_many :nested_field_tests, :dependent => :destroy, :inverse_of => :field_test
  accepts_nested_attributes_for :nested_field_tests, :allow_destroy => true

  # on creation, comment is not saved without :autosave => true
  has_one :comment, :as => :commentable, :autosave => true
  accepts_nested_attributes_for :comment, :allow_destroy => true

  attr_accessor :delete_paperclip_asset
  before_validation { self.paperclip_asset = nil if self.delete_paperclip_asset == '1' }

  field :dragonfly_asset_name
  field :dragonfly_asset_uid
  image_accessor :dragonfly_asset
  mount_uploader :carrierwave_asset, CarrierwaveUploader

  validates :short_text, :length => {:maximum => 255}
end
