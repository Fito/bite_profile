module ApplicationHelper
  def bootstrap_json
    render(
      partial: 'panel/bootstrap_data'
    )
  end
end
