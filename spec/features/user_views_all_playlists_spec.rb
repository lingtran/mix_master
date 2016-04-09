require 'rails_helper'

RSpec.feature "User can view all playlists" do
  scenario "they can see the hyperlinked name of each playlist" do
# Given that playlists exist in the database
    playlists = create_list(:playlist_with_songs, 2)
  # When I visit the playlists index

    visit playlists_path
  # Then I should see each playlist's name
    # And each name should link to that playlist's individual page

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end
end
