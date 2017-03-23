module BoardsHelper
  def get_boards_action(options = {})
    case
      when action_name == 'index'
        '/boards'
      when action_name == 'edit' && options[:id]
        "/boards/#{options[:id]}"
      else
        ''
    end
  end
end
