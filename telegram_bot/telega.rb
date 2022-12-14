class Telega
  def initialize(token)
    @token = token
    run
  end

  private

  def run
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        if message.class.to_s == "Telegram::Bot::Types::Message"
          message_logic(message, bot)
        elsif message.class.to_s == "Telegram::Bot::Types::CallbackQuery"
          callback_logic(message, bot)
        end
      end
    end
  end

  def in_kb
    [
        [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'По названию города', callback_data: 'nazvanie'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'По геолакации', callback_data: 'gelookacia'),
        ],
        [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Настройки', callback_data: 'nastroika'),
            Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Автор', callback_data: 'avtor')
        ],
    ]
  end

  def reply_markup(kb)
    Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb)
  end

  def inline_markup(kb)
    Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
  end

  def in_kb_nazvanie
    [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'По названию города', callback_data: 'nazvanie'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'По геолакации', callback_data: 'geolokacia'),
    ]
  end

  def in_rp_geolakacia
    [
        Telegram::Bot::Types::KeyboardButton.new(text: 'Нажми что-бы дать геолакацию', request_location: true)
    ]
  end

  def callback_logic(message, bot)
    if message.data == "nazvanie"
      bot.api.send_message(
          chat_id: message.from.id,
          text: "Напишите название города",
          reply_markup: inline_markup(in_kb_nazvanie))
    elsif message.data == "gelookacia"
      bot.api.send_message(
          chat_id: message.from.id,
          text: "Напишите название города",
          reply_markup: reply_markup(in_rp_geolakacia))
    end
  end

  def message_logic(message, bot)
    if message.location
      bot.api.send_message(chat_id: message.chat.id, text: Weather.current_by(message.location.latitude, message.location.longitude).pretty, reply_markup: inline_markup(in_kb))
    elsif message.text == '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Здраствуй #{message.from.first_name} Это Телеграм бот погоды", reply_markup: inline_markup(in_kb))
    elsif message.text == '/karakol_today'
      bot.api.send_message(chat_id: message.chat.id, text: Weather.current("karakol").pretty, reply_markup: inline_markup(in_kb))
    elsif message.text == '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Досвидание #{message.from.first_name}")
    else
      bot.api.send_message(chat_id: message.chat.id, text: Weather.current(message.text).pretty, reply_markup: inline_markup(in_kb))
    end
  end
end
