class QuotesController < R00lz::Controller
  def a_quote
    "Whats up doc?"
  end

  def card_trick
    binding.pry
    n = params["card"] || "Queen"
    "Your card: the #{n} of spades!"
  end

  def shakes
    @noun = :winking
    render(:shakes)
  end
end
