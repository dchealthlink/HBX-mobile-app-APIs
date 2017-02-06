class BaseUtil
  DIR_GENERATED = 'generated'
  GITHUB_URL_PREFIX = 'https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-API'

  def initialize args={}
    args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  #
  # Protected
  #
  protected

  def self.url path
    "#{GITHUB_URL_PREFIX}/#{$branch}/#{path}"
  end

end