class TrimmerDecorator < Decorator
  MAX_LENGTH = 10

  def correct_name
    super.correct_name[0, MAX_LENGTH]
  end
end
