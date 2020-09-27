SUBJECT_CLASSES = {
  Default: [
    {
      klass: 'Address', 
      methods: ['city', 'street_name', 'street_address', 'community']
    },
    {
      klass: 'App', 
      methods: ['name', 'author']
    },
    {
      klass: 'App', 
      methods: ['name', 'author']
    },
    {
      klass: 'Artist', 
      methods: ['name']
    },
    {
      klass: 'Artist', 
      methods: ['name']
    },
    {
      klass: 'Beer', 
      methods: ['brand', 'name', 'yeast']
    },
    {
      klass: 'Food', 
      methods: ['description', 'dish', 'fruits', 'ingredient']
    },
  ],
  Creature: [
    {
      klass: 'Animal',
      methods: ['name']
    },
    {
      klass: 'Cat',
      methods: ['name', 'breed', 'registry']
    },
    {
      klass: 'Dog',
      methods: ['name', 'breed', 'sound', 'meme_phrase', 'age']
    }
  ],
  Games: [
    {
      klass: 'DnD',
      methods: ['alignment', 'background', 'klass']
    },
    {
      klass: 'Dota',
      methods: ['hero', 'item', 'team']
    },
    {
      klass: 'LeagueOfLegends',
      methods: ['champion', 'location', 'quote', 'summoner_spell', 'masteries']
    },
    {
      klass: 'WorldOfWarcraft',
      methods: ['hero', 'quote']
    }
  ],
  JapaneseMedia: [
    {
      klass: 'DragonBall',
      methods: ['character']
    },
    {
      klass: 'OnePiece',
      methods: ['character', 'sea', 'island', 'location', 'quote', 'akuma_no_mi']
    },
    {
      klass: 'StudioGhibli',
      methods: ['character', 'quote', 'movie']
    }
  ],
  Movies: [
    {
      klass: 'HarryPotter',
      methods: ['character', 'location', 'quote', 'book']
    },
    {
      klass: 'Hobbit',
      methods: ['character', 'thorins_company', 'quote', 'location']
    },
    {
      klass: 'LordOfTheRings',
      methods: ['character', 'location']
    },
    {
      klass: 'StarWars',
      methods: ['character', 'quote']
    }
  ]
}.freeze

def rand_in_range(from, to)
  rand * (to - from) + from
end

%i[Default Creature Games JapaneseMedia Movies].each do |subject|
  Subject.create(name: subject) do |new_subject|
    print subject.to_s
    [*5000..10000].sample.times do
      chosen = SUBJECT_CLASSES[subject].sample 
      klass = "Faker::#{subject == :Default ? '' : "#{subject}::"}#{chosen[:klass]}".constantize

      published_at = Time.at(rand_in_range((Time.now - 2.months).to_f, Time.now.to_f))
      stars = [*1..5].sample
      title = klass.send(chosen[:methods].sample.to_sym)
      description = [*5..15].sample.times.map do |each_title|
        klass.send(chosen[:methods].sample.to_sym)
      end.join(', ')

      Website.create(
        title: title, 
        description: description, 
        published_at: published_at, 
        stars: stars, 
        subject: new_subject
      )
      print '*'
    end
  end
end

