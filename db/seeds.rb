# frozen_string_literal: true

unless Category.any?
  %w[ruby c go python].each do |title|
    Category.create(title:)
  end
end

unless Admin.any?
  Admin.create(
    first_name: 'admin',
    last_name: 'admin',
    email: ENV['ADMIN_MAIL'],
    password: ENV['ADMIN_PASS']
  )
end

unless Badge.any?
  Badge.create(
    title: 'Завершил все тесты о Руби',
    img: 'https://images.rbxcdn.com/6c2a598114231066a386fa716ac099c4.png',
    rule: 'category',
    rule_value: 'ruby'
  )
end