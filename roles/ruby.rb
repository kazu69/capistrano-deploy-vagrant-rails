name 'ruby'
description 'Ruby build with rbenv'

run_list(
  'recipe[ruby_build]',
  'recipe[rbenv]',
  'recipe[rbenv::user]'
)

override_attributes(
  :rbenv => {
    'user_installs' => [
      'global' => '2.1.0',
      'rubies' => [ '2.1.0' ],
      :user => 'vagrant',
      'gems'   => {
        '2.1.0' => [
          { name: 'bundler' },
          { name: 'therubyracer' }
        ]
      }
    ]
  }
)
