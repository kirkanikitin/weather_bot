require 'telegram/bot'


token = '5406769243:AAEE3gL36yUT6vrED6ODgZohZIJfybRHLTc'

money = 10
@money = money

def in_kb
  [
  Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Деньги', callback_data: 'denigi'),
  Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Правила', callback_data: 'pravila'),
  Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Магазин', callback_data: 'magazin')
  ]
end

def in_kb_magazin
  [
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Автокликер', callback_data: 'avtokliker')
  ]
end

def in_kb_nazad
  [
      Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Назад', callback_data: 'nazad')
  ]
end

def inline_markup(kb)
  Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
end

def colbek_logic(message, bot)
  if message.data == "denigi"
    bot.api.send_message(
        chat_id: message.from.id,
        text: "Вы заработали 10$\nВаш баланс: #{@money}$",
        reply_markup: inline_markup(in_kb))
    @money += 10
    elsif message.data == "magazin"
      bot.api.send_message(
          chat_id: message.from.id,
          text: "Магазин:",
          reply_markup: inline_markup(in_kb_magazin))
  elsif message.data == "avtokliker"
    if @money > 100
      bot.api.send_message(
      chat_id: message.from.id,
      text: "Вы купили Автокликер",
      reply_markup: inline_markup(in_kb_nazad))
      1000.times do
        sleep(3000)
        @money += 10
      end
    else
      bot.api.send_message(
      chat_id: message.from.id,
      text: "У вас недостаточно средств!")
      if message.data == "nazad"
      bot.api.send_message(
          chat_id: message.from.id,
          text: "Вы перешли в главную вкладку",
          reply_markup: inline_markup(in_kb))
      end
    end
  end
end

def message_logic(message, bot)
  if message.text == '/start'
    bot.api.send_message(chat_id: message.chat.id, text: "Здраствуйте #{message.from.first_name} это игра\n где надо нажимать на кнопку и зарабатывать деньги", reply_markup: inline_markup(in_kb))
  elsif message.text == '/stop'
    bot.api.send_message(chat_id: message.chat.id, text: "Досвидание #{message.from.first_name}")
  end
end

Telegram::Bot::Client.run(token) do |bot|
bot.listen do |message|
  if message.class.to_s == "Telegram::Bot::Types::Message"
    message_logic(message, bot)
  elsif message.class.to_s == "Telegram::Bot::Types::CallbackQuery"
    colbek_logic(message, bot)
    end
  end
end


