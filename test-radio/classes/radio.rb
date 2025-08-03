class Radio

  attr_reader :volume, :band
  @@fm_frequencies = 88.0..108.0
  @@am_frequencies = 540.0..1600.0

  @@default_fm_freq = 95.1
  @@default_am_freq = 540.0

  def self.am(options={})
    options.merge!({band: 'AM'})
    Radio.new(options)
  end

  def self.fm(options={})
    options.merge!({band: 'FM'})
    Radio.new(options)
  end

  def initialize(options={})
    self.volume = options[:volume] || 5
    self.band = options[:band] || 'FM'
    @am_frequency = @@default_am_freq
    @fm_frequency = @@default_fm_freq
    self.frequency = options[:frequency]
  end

  def volume=(value)
    return if value < 1 || value > 10
    @volume = value
  end

  def band=(value)
    return unless ['AM', 'FM'].include?(value)
  end

  def frequency
    @band == 'AM' ? @am_frequency : @fm_frequency
  end

  def frequency=(value)
    #convert to float in case a string is sent
    value = value.to_f
    return unless allowed_frequencies.include?(value)
    if @band == 'AM'
      @am_frequency = value
    else
      @fm_frequency = value
    end
  end

  def status
    "station: #{frequency} #{band}, volume: #{volume}"
  end

  private
  
    def allowed_frequencies
      @band == 'AM' ? @@am_frequencies : @@fm_frequencies
    end
 
end
