this_dir = File.expand_path(File.dirname(__FILE__))
proto_dir = File.join(this_dir, '..', 'proto', 'generated')
lib_dir = File.join(this_dir, '..', 'lib')
$LOAD_PATH.unshift(proto_dir)
$LOAD_PATH.unshift(lib_dir)

require 'mather_services_pb'
require 'grpc'
require 'mather'

class MatherService < Mather::Math::Service
  # add adds two numbers
  def add(req, _)
    # Validate input
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

    # Log progress
    puts "Adding #{req.First} to #{req.Second}"

    # Return added numbers
    Mather::MathAddReply.new(Result: MatherLib.new.add(req.First, req.Second))
  end

  # subtract subtracts two numbers
  def subtract(req, _)
    # Validate input
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

    # Log progress
    puts "Subtracting #{req.First} from #{req.Second}"

    # Return subtracted numbers
    Mather::MathSubtractReply.new(
      Result: MatherLib.new.subtract(req.First, req.Second)
    )
  end
end
