D, [2019-02-21T15:19:26.253516 #11538] DEBUG -- :   [1m[36mActiveRecord::SchemaMigration Load (0.1ms)[0m  [1mSELECT "schema_migrations".* FROM "schema_migrations"[0m
Run options: include {:focus=>true}

All examples were filtered out; ignoring {:focus=>true}

Playlister Basics
  index pages
    /songs
      responds with a 200 status code (FAILED - 1)
      displays a list of songs
      contains links to each song's show page (FAILED - 2)
    /artists
      responds with a 200 status code
      displays a list of artists
      contains links to each artist's show page
    /genres
      responds with a 200 status code (FAILED - 3)
      displays a list of genres
      contains links to each genre's show page (FAILED - 4)
  show pages
    /songs/:slug
      responds with a 200 status code (FAILED - 5)
      displays the song's artist (FAILED - 6)
      displays the song's genres (FAILED - 7)
      contains links to the artist's show page (FAILED - 8)
      contains links to each genre's show page (FAILED - 9)
    /artists/:slug
      responds with a 200 status code (FAILED - 10)
      displays the artist's songs (FAILED - 11)
      displays the artist's genres (FAILED - 12)
      contains links to each song's show page (FAILED - 13)
      contains links to each genre's show page (FAILED - 14)
    /genres/:slug
      responds with a 200 status code (FAILED - 15)
      displays the genre's artists (FAILED - 16)
      displays the genre's songs (FAILED - 17)
      contains links to each artist's show page (FAILED - 18)
      contains links to each song's show page (FAILED - 19)

Song Forms
  /songs/new
    without an existing artist
      creates a new artist on submit (FAILED - 20)
      creates a new song on submit (FAILED - 21)
      redirects to '/songs/:slug' after creation (FAILED - 22)
    with an existing artist
      does not create a new artist (FAILED - 23)
      creates a new song and associates it with an existing artist (FAILED - 24)
      redirects to '/songs/:slug' after creation (FAILED - 25)
  /songs/:slug/edit
    changing a song's artist
      updates the song's artist (FAILED - 26)
      renders to the song show page (FAILED - 27)
    changing a song's genres
      has a checkbox element on the form (FAILED - 28)
      updates the song's genres (FAILED - 29)
      renders to the song show page (FAILED - 30)

Artist
  can be initialized
  can have a name
  has many songs
  can have many genres
  can slugify its name
  Class methods
    given the slug can find an Artist

Song
  can initialize a song
  can have a name
  can have many genres
  has an artist
  can slugify its name (FAILED - 31)
  Class methods
    given the slug can find a song (FAILED - 32)

Genre
  can initialize a genre
  has a name
  has many songs
  has many artists
  can slugify its name (FAILED - 33)
  Class methods
    given the slug can find a genre (FAILED - 34)

Failures:

  1) Playlister Basics index pages /songs responds with a 200 status code
     Failure/Error: expect(page.status_code).to eq(200)

       expected: 200
            got: 500

       (compared using ==)
     # ./spec/features/04_basic_view_spec.rb:26:in `block (4 levels) in <top (required)>'

  2) Playlister Basics index pages /songs contains links to each song's show page
     Failure/Error: expect(page).to have_css("a[href='/songs/#{@song.slug}']")

     NoMethodError:
       undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
     # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
     # ./spec/features/04_basic_view_spec.rb:34:in `block (4 levels) in <top (required)>'

  3) Playlister Basics index pages /genres responds with a 200 status code
     Failure/Error: expect(page.status_code).to eq(200)

       expected: 200
            got: 500

       (compared using ==)
     # ./spec/features/04_basic_view_spec.rb:62:in `block (4 levels) in <top (required)>'

  4) Playlister Basics index pages /genres contains links to each genre's show page
     Failure/Error: expect(page).to have_css("a[href='/genres/#{@genre.slug}']")

     NoMethodError:
       undefined method `slug' for #<Genre id: 1, name: "New Age Garbage">
     # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
     # ./spec/features/04_basic_view_spec.rb:70:in `block (4 levels) in <top (required)>'

  5) Playlister Basics show pages /songs/:slug responds with a 200 status code
     Failure/Error: visit "/songs/#{@song.slug}"

     NoMethodError:
       undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
     # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
     # ./spec/features/04_basic_view_spec.rb:78:in `block (4 levels) in <top (required)>'

  6) Playlister Basics show pages /songs/:slug displays the song's artist
     Failure/Error: visit "/songs/#{@song.slug}"

     NoMethodError:
       undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
     # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
     # ./spec/features/04_basic_view_spec.rb:78:in `block (4 levels) in <top (required)>'

  7) Playlister Basics show pages /songs/:slug displays the song's genres
     Failure/Error: visit "/songs/#{@song.slug}"

     NoMethodError:
       undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
     # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
     # ./spec/features/04_basic_view_spec.rb:78:in `block (4 levels) in <top (required)>'

  8) Playlister Basics show pages /songs/:slug contains links to the artist's show page
     Failure/Error: visit "/songs/#{@song.slug}"

     NoMethodError:
       undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
     # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
     # ./spec/features/04_basic_view_spec.rb:78:in `block (4 levels) in <top (required)>'

  9) Playlister Basics show pages /songs/:slug contains links to each genre's show page
     Failure/Error: visit "/songs/#{@song.slug}"

     NoMethodError:
       undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
     # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
     # ./spec/features/04_basic_view_spec.rb:78:in `block (4 levels) in <top (required)>'

  10) Playlister Basics show pages /artists/:slug responds with a 200 status code
      Failure/Error: expect(page.status_code).to eq(200)

        expected: 200
             got: 500

        (compared using ==)
      # ./spec/features/04_basic_view_spec.rb:108:in `block (4 levels) in <top (required)>'

  11) Playlister Basics show pages /artists/:slug displays the artist's songs
      Failure/Error: expect(page).to have_content(song_name)
        expected #has_content?("That One with the Guitar") to return true, got false
      # ./spec/features/04_basic_view_spec.rb:112:in `block (4 levels) in <top (required)>'

  12) Playlister Basics show pages /artists/:slug displays the artist's genres
      Failure/Error: expect(page).to have_content(genre_name)
        expected #has_content?("New Age Garbage") to return true, got false
      # ./spec/features/04_basic_view_spec.rb:116:in `block (4 levels) in <top (required)>'

  13) Playlister Basics show pages /artists/:slug contains links to each song's show page
      Failure/Error: expect(page).to have_css("a[href='/songs/#{@song.slug}']")

      NoMethodError:
        undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/04_basic_view_spec.rb:120:in `block (4 levels) in <top (required)>'

  14) Playlister Basics show pages /artists/:slug contains links to each genre's show page
      Failure/Error: expect(page).to have_css("a[href='/genres/#{@genre.slug}']")

      NoMethodError:
        undefined method `slug' for #<Genre id: 1, name: "New Age Garbage">
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/04_basic_view_spec.rb:124:in `block (4 levels) in <top (required)>'

  15) Playlister Basics show pages /genres/:slug responds with a 200 status code
      Failure/Error: visit "/genres/#{@genre.slug}"

      NoMethodError:
        undefined method `slug' for #<Genre id: 1, name: "New Age Garbage">
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/04_basic_view_spec.rb:130:in `block (4 levels) in <top (required)>'

  16) Playlister Basics show pages /genres/:slug displays the genre's artists
      Failure/Error: visit "/genres/#{@genre.slug}"

      NoMethodError:
        undefined method `slug' for #<Genre id: 1, name: "New Age Garbage">
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/04_basic_view_spec.rb:130:in `block (4 levels) in <top (required)>'

  17) Playlister Basics show pages /genres/:slug displays the genre's songs
      Failure/Error: visit "/genres/#{@genre.slug}"

      NoMethodError:
        undefined method `slug' for #<Genre id: 1, name: "New Age Garbage">
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/04_basic_view_spec.rb:130:in `block (4 levels) in <top (required)>'

  18) Playlister Basics show pages /genres/:slug contains links to each artist's show page
      Failure/Error: visit "/genres/#{@genre.slug}"

      NoMethodError:
        undefined method `slug' for #<Genre id: 1, name: "New Age Garbage">
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/04_basic_view_spec.rb:130:in `block (4 levels) in <top (required)>'

  19) Playlister Basics show pages /genres/:slug contains links to each song's show page
      Failure/Error: visit "/genres/#{@genre.slug}"

      NoMethodError:
        undefined method `slug' for #<Genre id: 1, name: "New Age Garbage">
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/04_basic_view_spec.rb:130:in `block (4 levels) in <top (required)>'

  20) Song Forms /songs/new without an existing artist creates a new artist on submit
      Failure/Error: fill_in "Name", with: song_name

      Capybara::ElementNotFound:
        Unable to find field "Name"
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:302:in `block in synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/base.rb:83:in `synchronize'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:293:in `synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:48:in `find'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/actions.rb:90:in `fill_in'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/session.rb:744:in `block (2 levels) in <class:Session>'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/dsl.rb:51:in `block (2 levels) in <module:DSL>'
      # ./spec/features/05_song_form_spec.rb:19:in `block (5 levels) in <top (required)>'
      # ./spec/features/05_song_form_spec.rb:18:in `block (4 levels) in <top (required)>'

  21) Song Forms /songs/new without an existing artist creates a new song on submit
      Failure/Error: fill_in "Name", with: song_name

      Capybara::ElementNotFound:
        Unable to find field "Name"
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:302:in `block in synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/base.rb:83:in `synchronize'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:293:in `synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:48:in `find'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/actions.rb:90:in `fill_in'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/session.rb:744:in `block (2 levels) in <class:Session>'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/dsl.rb:51:in `block (2 levels) in <module:DSL>'
      # ./spec/features/05_song_form_spec.rb:27:in `block (4 levels) in <top (required)>'

  22) Song Forms /songs/new without an existing artist redirects to '/songs/:slug' after creation
      Failure/Error: fill_in "Name", with: song_name

      Capybara::ElementNotFound:
        Unable to find field "Name"
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:302:in `block in synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/base.rb:83:in `synchronize'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:293:in `synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:48:in `find'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/actions.rb:90:in `fill_in'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/session.rb:744:in `block (2 levels) in <class:Session>'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/dsl.rb:51:in `block (2 levels) in <module:DSL>'
      # ./spec/features/05_song_form_spec.rb:39:in `block (4 levels) in <top (required)>'

  23) Song Forms /songs/new with an existing artist does not create a new artist
      Failure/Error: fill_in "Name", with: song_name

      Capybara::ElementNotFound:
        Unable to find field "Name"
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:302:in `block in synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/base.rb:83:in `synchronize'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:293:in `synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:48:in `find'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/actions.rb:90:in `fill_in'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/session.rb:744:in `block (2 levels) in <class:Session>'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/dsl.rb:51:in `block (2 levels) in <module:DSL>'
      # ./spec/features/05_song_form_spec.rb:54:in `block (5 levels) in <top (required)>'
      # ./spec/features/05_song_form_spec.rb:53:in `block (4 levels) in <top (required)>'

  24) Song Forms /songs/new with an existing artist creates a new song and associates it with an existing artist
      Failure/Error: fill_in "Name", with: song_name

      Capybara::ElementNotFound:
        Unable to find field "Name"
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:302:in `block in synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/base.rb:83:in `synchronize'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:293:in `synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:48:in `find'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/actions.rb:90:in `fill_in'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/session.rb:744:in `block (2 levels) in <class:Session>'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/dsl.rb:51:in `block (2 levels) in <module:DSL>'
      # ./spec/features/05_song_form_spec.rb:62:in `block (4 levels) in <top (required)>'

  25) Song Forms /songs/new with an existing artist redirects to '/songs/:slug' after creation
      Failure/Error: fill_in "Name", with: song_name

      Capybara::ElementNotFound:
        Unable to find field "Name"
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:302:in `block in synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/base.rb:83:in `synchronize'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:293:in `synced_resolve'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/finders.rb:48:in `find'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/node/actions.rb:90:in `fill_in'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/session.rb:744:in `block (2 levels) in <class:Session>'
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/capybara-3.13.2/lib/capybara/dsl.rb:51:in `block (2 levels) in <module:DSL>'
      # ./spec/features/05_song_form_spec.rb:74:in `block (4 levels) in <top (required)>'

  26) Song Forms /songs/:slug/edit changing a song's artist updates the song's artist
      Failure/Error: visit "/songs/#{@song.slug}/edit"

      NoMethodError:
        undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/05_song_form_spec.rb:93:in `block (3 levels) in <top (required)>'

  27) Song Forms /songs/:slug/edit changing a song's artist renders to the song show page
      Failure/Error: visit "/songs/#{@song.slug}/edit"

      NoMethodError:
        undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/05_song_form_spec.rb:93:in `block (3 levels) in <top (required)>'

  28) Song Forms /songs/:slug/edit changing a song's genres has a checkbox element on the form
      Failure/Error: visit "/songs/#{@song.slug}/edit"

      NoMethodError:
        undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/05_song_form_spec.rb:93:in `block (3 levels) in <top (required)>'

  29) Song Forms /songs/:slug/edit changing a song's genres updates the song's genres
      Failure/Error: visit "/songs/#{@song.slug}/edit"

      NoMethodError:
        undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/05_song_form_spec.rb:93:in `block (3 levels) in <top (required)>'

  30) Song Forms /songs/:slug/edit changing a song's genres renders to the song show page
      Failure/Error: visit "/songs/#{@song.slug}/edit"

      NoMethodError:
        undefined method `slug' for #<Song id: 1, name: "That One with the Guitar", artist_id: 1>
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/features/05_song_form_spec.rb:93:in `block (3 levels) in <top (required)>'

  31) Song can slugify its name
      Failure/Error: expect(@song.slug).to eq("blank-space")

      NoMethodError:
        undefined method `slug' for #<Song id: 1, name: "Blank Space", artist_id: 1>
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/models/02_song_spec.rb:33:in `block (2 levels) in <top (required)>'

  32) Song Class methods given the slug can find a song
      Failure/Error: expect((Song.find_by_slug(slug)).name).to eq("Blank Space")

      NoMethodError:
        undefined method `find_by_slug' for Song(id: integer, name: string, artist_id: integer):Class
        Did you mean?  find_by_sql
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activerecord-4.2.5/lib/active_record/dynamic_matchers.rb:26:in `method_missing'
      # ./spec/models/02_song_spec.rb:40:in `block (3 levels) in <top (required)>'

  33) Genre can slugify its name
      Failure/Error: expect(genre.slug).to eq("alternative-rock")

      NoMethodError:
        undefined method `slug' for #<Genre id: 2, name: "Alternative Rock">
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
      # ./spec/models/03_genre_spec.rb:35:in `block (2 levels) in <top (required)>'

  34) Genre Class methods given the slug can find a genre
      Failure/Error: expect((Genre.find_by_slug(slug)).name).to eq("Alternative Rock")

      NoMethodError:
        undefined method `find_by_slug' for Genre(id: integer, name: string):Class
        Did you mean?  find_by_sql
      # /Users/katiecarrel/.rvm/gems/ruby-2.3.3/gems/activerecord-4.2.5/lib/active_record/dynamic_matchers.rb:26:in `method_missing'
      # ./spec/models/03_genre_spec.rb:42:in `block (3 levels) in <top (required)>'

Finished in 4.98 seconds (files took 1.08 seconds to load)
53 examples, 34 failures

Failed examples:

rspec ./spec/features/04_basic_view_spec.rb:25 # Playlister Basics index pages /songs responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:33 # Playlister Basics index pages /songs contains links to each song's show page
rspec ./spec/features/04_basic_view_spec.rb:61 # Playlister Basics index pages /genres responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:69 # Playlister Basics index pages /genres contains links to each genre's show page
rspec ./spec/features/04_basic_view_spec.rb:81 # Playlister Basics show pages /songs/:slug responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:85 # Playlister Basics show pages /songs/:slug displays the song's artist
rspec ./spec/features/04_basic_view_spec.rb:89 # Playlister Basics show pages /songs/:slug displays the song's genres
rspec ./spec/features/04_basic_view_spec.rb:93 # Playlister Basics show pages /songs/:slug contains links to the artist's show page
rspec ./spec/features/04_basic_view_spec.rb:97 # Playlister Basics show pages /songs/:slug contains links to each genre's show page
rspec ./spec/features/04_basic_view_spec.rb:107 # Playlister Basics show pages /artists/:slug responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:111 # Playlister Basics show pages /artists/:slug displays the artist's songs
rspec ./spec/features/04_basic_view_spec.rb:115 # Playlister Basics show pages /artists/:slug displays the artist's genres
rspec ./spec/features/04_basic_view_spec.rb:119 # Playlister Basics show pages /artists/:slug contains links to each song's show page
rspec ./spec/features/04_basic_view_spec.rb:123 # Playlister Basics show pages /artists/:slug contains links to each genre's show page
rspec ./spec/features/04_basic_view_spec.rb:133 # Playlister Basics show pages /genres/:slug responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:137 # Playlister Basics show pages /genres/:slug displays the genre's artists
rspec ./spec/features/04_basic_view_spec.rb:141 # Playlister Basics show pages /genres/:slug displays the genre's songs
rspec ./spec/features/04_basic_view_spec.rb:145 # Playlister Basics show pages /genres/:slug contains links to each artist's show page
rspec ./spec/features/04_basic_view_spec.rb:149 # Playlister Basics show pages /genres/:slug contains links to each song's show page
rspec ./spec/features/05_song_form_spec.rb:17 # Song Forms /songs/new without an existing artist creates a new artist on submit
rspec ./spec/features/05_song_form_spec.rb:26 # Song Forms /songs/new without an existing artist creates a new song on submit
rspec ./spec/features/05_song_form_spec.rb:38 # Song Forms /songs/new without an existing artist redirects to '/songs/:slug' after creation
rspec ./spec/features/05_song_form_spec.rb:52 # Song Forms /songs/new with an existing artist does not create a new artist
rspec ./spec/features/05_song_form_spec.rb:61 # Song Forms /songs/new with an existing artist creates a new song and associates it with an existing artist
rspec ./spec/features/05_song_form_spec.rb:73 # Song Forms /songs/new with an existing artist redirects to '/songs/:slug' after creation
rspec ./spec/features/05_song_form_spec.rb:97 # Song Forms /songs/:slug/edit changing a song's artist updates the song's artist
rspec ./spec/features/05_song_form_spec.rb:106 # Song Forms /songs/:slug/edit changing a song's artist renders to the song show page
rspec ./spec/features/05_song_form_spec.rb:114 # Song Forms /songs/:slug/edit changing a song's genres has a checkbox element on the form
rspec ./spec/features/05_song_form_spec.rb:118 # Song Forms /songs/:slug/edit changing a song's genres updates the song's genres
rspec ./spec/features/05_song_form_spec.rb:130 # Song Forms /songs/:slug/edit changing a song's genres renders to the song show page
rspec ./spec/models/02_song_spec.rb:31 # Song can slugify its name
rspec ./spec/models/02_song_spec.rb:37 # Song Class methods given the slug can find a song
rspec ./spec/models/03_genre_spec.rb:32 # Genre can slugify its name
rspec ./spec/models/03_genre_spec.rb:39 # Genre Class methods given the slug can find a genre

