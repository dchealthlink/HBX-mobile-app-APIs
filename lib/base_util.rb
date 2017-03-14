class BaseUtil
  attr_accessor :use_case_directory

  def initialize args={}
    args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def fixed_shuffler
    Random.new(@use_case_directory.length)
  end

  def shuffled list
    list.shuffle(random: fixed_shuffler)
  end

  def pick_from list
    shuffled(list).first
  end

  #
  # Protected
  #
  protected

  def self.url path
    "#{$github_url_prefix}/#{path}"
  end

end