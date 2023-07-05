class CapitalDecorator < Decorator
  def correct_name
    super.correct_name.capitalize
  end
end
