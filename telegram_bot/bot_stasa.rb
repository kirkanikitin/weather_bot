require 'telegram/bot'

class TelegramBot
  def initialize(token)
    @token = token
  end

  def start
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        MessageLogic.new(message, bot)
      end
    end
  end

  private

  class MessageLogic
    def initialize(message, bot)
      @message = message
      @bot = bot

      manage
    end

    private

    def manage
      p @message
      return if @message.class.to_s == "Telegram::Bot::Types::ChatMemberUpdated"

      message_logic if @message.class.to_s == "Telegram::Bot::Types::Message"
      callback_logic if @message.class.to_s == "Telegram::Bot::Types::CallbackQuery"
    end
    a
    def message_logic
      if @message.text == '/start'
        @bot.api.send_message(chat_id: @message.chat.id, text: "#{@message.from.first_name}", reply_markup: in_markup(start_in_kb))
      end
    end

    def in_markup(kb)
      Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
    end

    def callback_logic
      if @message.data == "najatie"
        @bot.api.edit_message_text(
            chat_id: @message.from.id,
            message_id: @message.message.message_id,
            text: "Обновлённый текст поста",
            reply_markup: in_markup(kirill_kb),
            parse_mode: "html"
        )
        @bot.api.send_message(chat_id: @message.from.id, text: "Я не думал что ты додумаешься нажать на эту кнопку... Ну поздравляю, ты просто взял и повёлся на байт лол")
      end
    end

    def start_in_kb
      [
          inline_kb.new(text: 'Go to Google', url: 'https://google.com'),
          inline_kb.new(text: 'Нажми меня', callback_data: 'najatie'),
          inline_kb.new(text: 'Switch to inline', switch_inline_query: 'some text')
      ]
    end

    def inline_kb
      Telegram::Bot::Types::InlineKeyboardButton
    end

    def kirill_kb
      [
          [
              inline_kb.new(text: 'Бебра', callback_data: 'bebra'),
              inline_kb.new(text: 'Не бебра', callback_data: 'ne_bebra'),
          ]
      ]
    end
  end
end


my_telega = TelegramBot.new("")
my_telega.start
