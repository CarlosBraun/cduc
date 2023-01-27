require 'securerandom'

include FactoryBot::Syntax::Methods
FactoryBot.define do
  factory :evaluacion do
    title { "MyString" }
  end

  factory :anuncio do
    title { "MyString" }
    description { "MyText" }
    categoria { "MyString" }
    remitente { "MyString" }
  end

  factory :horario do
    title { "MyString" }
    categoria { "MyString" }
    start_time { "2023-01-19 12:15:46" }
    end_time { "2023-01-19 12:15:46" }
  end

  factory :consultation do
    title { "MyString" }
    description { "MyText" }
    start_time { "2023-01-18 08:47:53" }
    end_time { "2023-01-18 08:47:53" }
  end

  factory :noticium do
    titulo { "MyString" }
    texto { "MyString" }
    categoria { "MyString" }
  end

  factory :jugador do
    mail { "MyString" }
    name { "MyString" }
    last_name { "MyString" }
    telephone { "MyString" }
  end

  factory :entrenador do
    mail { "MyString" }
    name { "MyString" }
    last_name { "MyString" }
    telephone { "MyString" }
  end

  factory :organizer do
    name { "MyString" }
    address { "MyString" }
    email { "MyString" }
  end

  factory :user do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { "#{first_name.gsub(/\s+/, "")}.#{last_name.gsub(/\s+/, "")}@example.com".downcase }
    phone { rand(10**9..10**10).to_s }

    factory :customer_with_orders do
      transient do
        orders_count { rand(1..10) }
      end

      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.orders_count, customer: customer)
      end
    end
  end

  factory :event do
    name { Faker::Esport.event }
    description { Faker::ChuckNorris.fact }
    start_date { Faker::Date.between(from: 6.months.ago, to: Date.today) }
    event_venue { EventVenue.offset(rand(EventVenue.count)).first }

    factory :event_with_ticket_types_and_tickets do
      transient do
        ticket_types_count { rand(1..5) }
      end

      after(:create) do |event, evaluator|
          create_list(:ticket_type_with_tickets, evaluator.ticket_types_count, event: event)
      end
    end
  end

  factory :event_venue do
    name { Faker::WorldCup.stadium }
    address { Faker::Address.street_address }
    capacity { rand(1..7) * 10000 }
  end

  factory :ticket_type do
    price { Faker::Number.within(range: 10..100) * 1000 }
    name { Faker::Lorem.sentence }

    factory :ticket_type_with_tickets do
      transient do
        # Create 1000 to 5000 tickets per event
        tickets_count { rand(1..5)*10 }
      end

      after(:create) do |ticket_type, evaluator|
        create_list(:ticket, evaluator.tickets_count, ticket_type: ticket_type)
      end
    end
  end

  factory :ticket do
    ticket_type
    order { Order.offset(rand(Order.count)).first }
  end

  factory :order do
    #customer
  end
end
