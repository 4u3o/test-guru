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
