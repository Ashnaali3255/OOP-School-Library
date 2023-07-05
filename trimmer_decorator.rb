class TrimmerDecorator < Decorator
  MAX_LENGTH = 10

  def correct_name
    @nameable.correct_name.length > MAX_LENGTH ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end
