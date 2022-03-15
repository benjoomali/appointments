# Appointments

Appointments is my personal project on Rails to create an appointment/consultation based booking system similar to something like Calendly.

I also wanted to build it on a modern stack of Rails 7, Ruby 3+, Hotwire and Stimulus.

```
bundle install
yarn install
bin/dev
```

### Includes
* TailwindCSS
* Stimulus
* Hotwire
* Rails 7
* Ruby 3
* Simple Calendar Gem

### How it Works

Users can create Forms and Calendars to define their availability and schedule. When a FormEntry is submitted, it will also have an appointment date and time attached.

The calendar will determine slots and prevent other users from double-booking.
