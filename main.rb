require 'telegram/bot'

TOKEN = '1123703851:AAFGX9DIdnPZyx5VsRzmTZRGG_bkJs3tjc4'

ANSWERS = [
    #Положительные:
    'Бесспорно',
    'Предрешено',
    'Никаких сомнений',
    'Определённо да',
    'Можешь быть уверен в этом',
    #Нерешительно положительные
    'Мне кажется — «да»',
    'Вероятнее всего',
    'Хорошие перспективы',
    'Знаки говорят — «да»',
    'Да',
    #Нейтральные:
    'Пока не ясно, попробуй снова',
    'Спроси позже',
    'Лучше не рассказывать',
    'Сейчас нельзя предсказать',
    'Сконцентрируйся и спроси опять',
    #Отрицательные:
    'Даже не думай',
    'Мой ответ — «нет»',
    'По моим данным — «нет»',
    'Перспективы не очень хорошие',
    'Весьма сомнительно'
]


puts('----------------------------- RUN BOT -----------------------------')

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
    case message.text
        when '/start', '/start start'
            bot.api.send_message(
                chat_id: message.chat.id,
                text: 'Привет, ' + message.from.first_name
            )
        when '/stop'
            bot.api.send_message(
                chat_id: message.chat.id,
                text: 'Пока, ' + message.from.first_name + '...Заходи еще...'
            )
        else
            bot.api.send_message(
                chat_id: message.chat.id,
                text: ANSWERS.sample
            )
        end
    end
end
