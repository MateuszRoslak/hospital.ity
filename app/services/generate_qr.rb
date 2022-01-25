class GenerateQr < ApplicationService
  attr_reader :device

  def initialize(device)
    @device = device
  end

  include Rails.application.routes.url_helpers

  require "rqrcode"

  def call
    qr_url = url_for(controller: 'devices',
                     action: 'show',
                     id: @device.id,
                     only_path: false,
                     host: 'localhost:3000')

    qr_code = RQRCode::QRCode.new(qr_url)

    png = qr_code.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 240
    )

    image_name = "device-#{@device.id}-qr-code.png"
    IO.binwrite("/tmp/#{image_name}", png.to_s)

    blob = ActiveStorage::Blob.create_after_upload!(
      io: File.open("/tmp/#{image_name}"),
      filename: image_name,
      content_type: 'png'
    )

    @device.qr_code.attach(blob)
  end
end

