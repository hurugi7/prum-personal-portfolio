User.create!(name: 'test user', email: 'testuser@example.com',
            introduce_messages: 'こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。
                                 こんにちは、私はテストユーザーです。',
            password: 'password')

Category.create!(name: 'バックエンド')
Category.create!(name: 'フロントエンド')
Category.create!(name: 'インフラ')

Skill.create!([
  {
    name: 'Rails',
    level: '15',
    category_id: 1,
    user_id: '1'
  },
  {
    name: 'PHP',
    level: '38',
    category_id: '1',
    user_id: '1'
  },
  {
    name: 'Ruby',
    level: '26',
    category_id: '1',
    user_id: '1',
    created_at: Time.now.months_ago(2),
    updated_at: Time.now.months_ago(2) + 10.days
  },
  {
    name: 'HTML',
    level: '35',
    category_id: '2',
    user_id: '1'
  },
  {
    name: 'CSS',
    level: '58',
    category_id: '2',
    user_id: '1'
  },
  {
    name: 'JavaScript',
    level: '68',
    category_id: '2',
    user_id: '1',
    created_at: Time.now.months_ago(2),
    updated_at: Time.now.months_ago(2) + 10.days
  },
  {
    name: 'Heroku',
    level: '53',
    category_id: '3',
    user_id: '1'
  },
  {
    name: 'AWS',
    level: '63',
    category_id: '3',
    user_id: '1',
    created_at: Time.now.months_ago(1),
    updated_at: Time.now.months_ago(1) + 10.days
  },
  {
    name: 'Firebase',
    level: '23',
    category_id: '3',
    user_id: '1'
  }
]
)
