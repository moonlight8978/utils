class TracklistsNotMatch < StandardError
  MESSAGE = [
    "Original and Language tracklists do not match together",
    "(number of tracks). Please try again."
  ].join(" ")

  def initialize(message = MESSAGE)
    super(message)
  end
end
