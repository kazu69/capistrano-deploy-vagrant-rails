name 'base'
description 'Basement'

run_list(
  'recipe[apt]',
  'recipe[git]'
)
