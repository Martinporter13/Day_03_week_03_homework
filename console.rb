require('pry-byebug')
require_relative('./models/artists.rb')
require_relative('./models/albums.rb')

Album.delete_all()
Artist.delete_all()



artist1 = Artist.new(
  {
    'artist_name' => 'Linkin_Park'
  }
)

artist2 = Artist.new(
  {
    'artist_name' => 'Rammstein'
  }
)

artist1.save()
artist2.save()

album1 = Album.new(
  {
    'album_name' => 'Hybrid_Theory',
    'genre' => 'Nu_metal',
    'artist_id' => artist1.id

  }
)

album2 = Album.new(
  {
    'album_name' => 'Rosenrot',
    'genre' => 'Metal',
    'artist_id' => artist2.id
  }
)

album1.save()
album2.save()






binding.pry
nil
