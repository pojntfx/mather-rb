this_dir = File.expand_path(File.dirname(__FILE__))
proto_dir = File.join(this_dir, 'proto')
lib_dir = File.join(this_dir, '..', 'lib')
$LOAD_PATH.unshift(proto_dir)
$LOAD_PATH.unshift(lib_dir)

require 'mather_services_pb'
require 'grpc'
require 'mather'

class MatherService < Mather::Math::Service
  def add(req, _)
    if req.First == 0
      raise GRPC::BadStatus.new(
              GRPC::Core::StatusCodes::INVALID_ARGUMENT,
              'Could not add, `First` has not been provided'
            )
    end

    if req.Second == 0
      raise GRPC::BadStatus.new(
              GRPC::Core::StatusCodes::INVALID_ARGUMENT,
              'Could not add, `Second` has not been provided'
            )
    end

    puts "Adding #{req.First} to #{req.Second}"

    Mather::MathAddReply.new(Result: MatherLib.new.add(req.First, req.Second))
  end

  def subtract(req, _)
    if req.First == 0
      raise GRPC::BadStatus.new(
              GRPC::Core::StatusCodes::INVALID_ARGUMENT,
              'Could not add, `First` has not been provided'
            )
    end

    if req.Second == 0
      raise GRPC::BadStatus.new(
              GRPC::Core::StatusCodes::INVALID_ARGUMENT,
              'Could not add, `Second` has not been provided'
            )
    end

    puts "Subtracting #{req.First} from #{req.Second}"

    Mather::MathSubtractReply.new(
      Result: MatherLib.new.subtract(req.First, req.Second)
    )
  end
end
