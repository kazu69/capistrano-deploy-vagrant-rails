name 'application'
description 'setup application'

run_list(
  'recipe[app::nginx]',
  'recipe[app::detabase]'
)
