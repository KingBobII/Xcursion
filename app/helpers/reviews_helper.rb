module ReviewsHelper
  def star_rating(rating)
    content_tag(:div, class: 'star-rating') do
      (rating || 0).clamp(1, 5).times do
        concat content_tag(:span, '★ ', class: 'star')
      end
    end
  end
end
