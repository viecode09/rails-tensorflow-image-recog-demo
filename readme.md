# Demo project created by Xiaozhong Hua (Jim)
This is a demo project, based at Ruby-on-Rails, gRPC and tensorflow. The prototype wants to show how Google's AI features can be called from any Web client directly.

## Setup & Run

#### You need to be sure that Ruby-on-Rails and tensorflow work at your machine. If they aren't done for you, please refer to: http://guides.rubyonrails.org/getting_started.html and https://www.tensorflow.org/versions/r0.12/get_started/os_setup.html.

#### Git clone the repository to your local site.

#### cd rails-tensorflow-image-recog-demo.

#### Add your server ip address into config/environment/developments.rb:
* config.server_ip = your_server_ip_address (it is 192.168.0.3, on my case)
* Add it into production.rb and test.rb if you need, as well.

#### Open a console then input: bin/setup
* It stops with displaying "== Restarting application server =="
* Open another console and input: bin/rails s -b your_server_ip_address (on my case, it is 192.168.0.3)

#### Open a browser: [http://your_server_ip_address:3000], (the address is 192.168.0.3, on my case).
* Press "Welcome to My AI system".

#### You can download some pictures from internet into a folder at your device.
* Press "Choose File", go to the folder your pictures is stored, select one, press "Open".
* Press "Recognizing".
* Wait for a while, you shall see a page that the AI system shows back to you as: [rails-tensorflow-image-recog-demo](screenshot-2017-07-17.png)

### Got reference from
- https://github.com/qinix/grpc_rails.
