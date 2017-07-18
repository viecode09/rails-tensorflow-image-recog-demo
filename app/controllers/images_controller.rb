this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'helloworld_services_pb'
require 'socket'

class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def edit
    @image = Image.find(params[:id])
    @ip_address = Socket.ip_address_list.find { |ip| ip.ipv4? && !ip.ipv4_loopback? }.ip_address
    print("\n============= #{@ip_adddress} ================= \n")
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def update
  @image = Image.find(params[:id])
#    print "== Controller.update == \n"

    uploaded_io = params[:image][:title]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

#    print "\n == gRPC trial == \n"
      stub = Helloworld::Greeter::Stub.new('localhost:50051', :this_channel_is_insecure)
#        user = ARGV.size > 0 ?  ARGV[0] : 'Hua'
#        msg = stub.say_hello(Helloworld::HelloRequest.new(name: user)).message
      msg = stub.say_hello(Helloworld::HelloRequest.new(name: uploaded_io.original_filename)).message
      print "\n == msg: #{msg} == \n\n"
      @ip_address = Socket.ip_address_list.find { |ip| ip.ipv4? && !ip.ipv4_loopback? }.ip_address
print "\n============= #{Rails.application.config.server_ip} ================= \n"
#  print(params[:image][:title])
#  print("\n===\n")
#  print(params[:image][:text])
#  print("\n=====\n")

      params[:image][:title] = uploaded_io.original_filename
      params[:image][:text] = msg

#    if @image.update(image_params)
   @image.update(image_params)

#      redirect_to @images
#       redirect_to images_path
#    else
  render 'edit'
#    end
end

def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to images_path
  end

  def upload

  end
private
  def image_params
    params.require(:image).permit(:title, :text)
  end

end
