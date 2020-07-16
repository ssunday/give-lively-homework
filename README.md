# Give Lively Interview Code

Give Lively code for interview process.

## Requirements

- Ruby 2.6.6
- Postgres (10+)

## Setup

- `bundle install`
- `bin/rails db:setup`
- `bin/rails s`

## Testing

`bundle exec rspec`

## Linting

`bundle exec rubocop -a`

## TODO

- [ ] Add date range on draft transactions
- [x] Setup Check Transaction <> donations relationship join table
- [ ] Setup Cron/Transaction job fully to create transactions at 15th of every month
- [ ] Better LOB error handling
- [ ] Pagination with nonprofits
- [ ] Setup webhook ingestion of LOB status change
- [ ] Add seeds
- [ ] Better validations/responses
