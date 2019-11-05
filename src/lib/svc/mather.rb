this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, '..', 'proto')
$LOAD_PATH.unshift(lib_dir)

require 'mather_services_pb'

class MatherServer < Mather::Math::Service
  def add(req, _)
    Mather::MathAddReply.new(Result: req.First + req.Second)
  end

  def subtract(req, _)
    Mather::MathSubtractReply.new(Result: req.Second - req.First)
  end
end
