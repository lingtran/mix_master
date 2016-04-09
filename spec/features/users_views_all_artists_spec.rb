require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see a name hyperlinked for each artist page" do
    artist_one = Artist.create(name: "Bob Marley", image_path:"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    artist_two = Artist.create(name: "Justin Timberlake", image_path: "http://cdn2.pitchfork.com/news/53421/bb16fa86.jpg")

    visit artists_path
    expect(page).to have_content artist_one.name
    expect(page).to have_content artist_two.name
    expect(page).to have_link artist_one.name, href: artist_path(artist_one)
    expect(page).to have_link artist_two.name, href: artist_path(artist_two)

  end
end
