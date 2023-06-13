def handle_option(option, books, people, rentals)
  option_actions = {
    1 => -> { list_all_books(books) },
    2 => -> { list_all_people(people) },
    3 => -> { create_person(people) },
    4 => -> { create_book(books) },
    5 => -> { create_rental(people, books, rentals) },
    6 => -> { list_rentals(rentals) },
    7 => -> { quit }
  }

  action = option_actions[option]
  if action
    action.call
  else
    puts 'Invalid option!'
  end
end
