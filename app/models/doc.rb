require "digest/md5"

class Doc < ActiveRecord::Base
  @@storage_path = "#{RAILS_ROOT}/files"

  has_one :user
  has_one :category
  belongs_to :project

  def file=(incoming_file)
    unless incoming_file.nil?
      @temp_file = incoming_file
      if @temp_file.size > 0
        self.filename = sanitize_filename(@temp_file.original_filename)
        self.disk_filename = Doc.disk_filename(filename)
        #self.category_id = @temp_file.content_type.to_s.chomp
      end
    end
  end

  def diskfile
    "#{@@storage_path}/#{self.filename}"
  end


  def before_save
    if @temp_file && (@temp_file.size > 0)
      md5 = Digest::MD5.new
      File.open(diskfile, "wb") do |f|
        buffer = ""
        while (buffer = @temp_file.read(8192))
          f.write(buffer)
          md5.update(buffer)
        end
      end
      self.digest = md5.hexdigest
    end
    # Don't save the content type if it's longer than the authorized length
#    if self.content_type && self.content_type.length > 255
#      self.content_type = nil
#    end
  end

  private

  def sanitize_filename(value)
    just_filename = value.gsub(/^.*(\\|\/)/, '')
    @filename = just_filename.gsub(/[^\w\.\-]/, '_')
  end

  def self.disk_filename(filename)
    df = DateTime.now.strftime("%y%m%d%H%M%S") + "_"
    if filename =~ %r{^[a-zA-Z0-9_\.\-]*$}
      df << filename
    else
      df << Digest::MD5.hexdigest(filename)
      df << $1 if filename =~ %r{(\.[a-zA-Z0-9]+)$}
    end
    df
  end
end
