class BaseUtil
  attr_accessor :use_case_directory

  def initialize args={}
    args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def fixed_shuffler
    Random.new(@use_case_directory.gsub(/[^0-9A-Za-z]/, '').downcase.to_i(36)) #base-36 hash of alphanums
  end

  def shuffled list
    list.shuffle(random: fixed_shuffler)
  end

  def pick_from list
    shuffled(list).first
  end

  def pick_from_range range 
    pick_from range.to_a
  end

  #
  # Protected
  #
  protected

  def self.url path
    "#{$github_url_prefix}/#{path}"
  end

end